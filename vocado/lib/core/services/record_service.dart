import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/v7.dart';
import 'package:vocado/core/errors/failure.dart';

@lazySingleton
class RecordService {
  final _record = AudioRecorder();

   void requestPermission() async {
    final hasPermission = await _record.hasPermission(request: true);
    if (!hasPermission) {
      throw PermissionFailure("record not allow");
    }
  }

  Future<void> startRecord() async {
    final Directory tempDir = await getTemporaryDirectory();
    final name = UuidV7().generate();

    await _record.start(
      const RecordConfig(),
      path: '${tempDir.path}/$name.m4a',
    );
  }

  Future<String?> stopRecord() async {
    final path = await _record.stop();

    return path;
  }
}