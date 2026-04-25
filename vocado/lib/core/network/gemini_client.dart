import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_endpoints.dart';

@lazySingleton
class GeminiClient {
  final Dio dio;

  GeminiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiEndpoints.geminiBaseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );
}