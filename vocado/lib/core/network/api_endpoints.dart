// api_endpoints.dart
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.gladia.io/v2';
  static const String uploadEndPoint = '/upload';
  static const String preRecordedEndPoint = '/pre-recorded';
  static const String geminiBaseUrl =
      "https://generativelanguage.googleapis.com/v1/";
  static const String generateContent = "models/gemini-2.5-flash:generateContent";
}
