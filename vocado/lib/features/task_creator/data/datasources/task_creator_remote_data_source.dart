import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/model/task_model/task_model.dart';
import 'package:vocado/core/network/dio_client.dart';
import 'package:vocado/core/network/gemini_method.dart';
import 'package:vocado/core/network/gladia_method.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/services/record_service.dart';

abstract class BaseTaskCreatorRemoteDataSource {
  Future<bool> startVoice();
  Future<TaskModel> stopVoice();
}

@LazySingleton(as: BaseTaskCreatorRemoteDataSource)
class TaskCreatorRemoteDataSource implements BaseTaskCreatorRemoteDataSource {
  final SupabaseClient _supabase;
  final DioClient _dio;
  final RecordService _recordService;

  TaskCreatorRemoteDataSource(this._dio, this._supabase, this._recordService);

  @override
  Future<bool> startVoice() async {
    try {
      await _recordService.startRecord();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<TaskModel> stopVoice() async {
    try {
      final record = await _recordService.stopRecord();
      print("record path: $record");
      final uploadUrl = await _dio.uploadVoiceMethod(file: File(record!));
      print("uploading file...");
      final transcriptionId = await _dio.transcriptionMethod(url: uploadUrl);
      final result = await _dio.getResult(id: transcriptionId);

      final transcript = result['transcription']['full_transcript'];
      print("TRANSCRIPT: $transcript");
      final geminiResult = await _dio.generateTask(transcript); 
      print("GEMINI RESULT: $geminiResult");

      return TaskModel.fromJson(geminiResult);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}