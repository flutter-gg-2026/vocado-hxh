import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/v7.dart';
import 'package:vocado/core/errors/failure.dart';

@lazySingleton
class RecordService {
  final _record = AudioRecorder();

  Future<void> requestPermission() async {
    final hasPermission = await _record.hasPermission(request: true);
    print("Permission granted: $hasPermission");
    if (!hasPermission) {
      throw PermissionFailure("record not allow");
    }
  }

  Future<void> startRecord() async {
    await requestPermission();

    final Directory tempDir = await getTemporaryDirectory();
    final name = UuidV7().generate();

    await _record.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        sampleRate: 44100,
      ),
      path: '${tempDir.path}/$name.m4a',
    );
  }

  Future<String?> stopRecord() async {
    final path = await _record.stop();

    print("record path: $path");
    if (path == null) return null;
    final file = File(path);

    final exists = await file.exists();
    print("file exists: $exists");
    if (!exists) {
      throw FileSystemException("Recording file not created");
    }

    return path;
  }
}
