import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vocado/core/network/api_endpoints.dart';
import 'package:vocado/core/network/dio_client.dart';


extension GladiaExtension on DioClient {
  Future<String> uploadVoiceMethod({required File file}) async {
    FormData formData = FormData.fromMap({
      "audio": await MultipartFile.fromFile(file.path),
    });

    final response = await dio.post(
      ApiEndpoints.uploadEndPoint,
      options: Options(headers: {"Content-Type": 'multipart/form-data'}),
      data: formData,
    );

    return response.data['audio_url'];
  }

  Future<String> transcriptionMethod({required String url}) async {
    final response = await dio.post(
      ApiEndpoints.preRecordedEndPoint,
      data: {'audio_url': url},
    );

    return response.data['id'];
  }

  Future<Map<String, dynamic>> getResult({required String id}) async {
    late Response response;
    do {
      response = await dio.get("${ApiEndpoints.preRecordedEndPoint}/$id");
      await Future.delayed(Duration(seconds: 2));
    } while (response.data['status'] != 'done');

    return response.data["result"];
  }
}