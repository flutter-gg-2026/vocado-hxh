import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/network/api_endpoints.dart';
import 'package:vocado/core/network/gemini_client.dart';

@lazySingleton
class GeminiService {
  final GeminiClient client;
  GeminiService(this.client);

  Future<Map<String, dynamic>> generateTask(String transcript) async {
    print("🔥 GEMINI CALLED");

    final apiKey = dotenv.env['gemini_key'];
    print("API KEY: $apiKey");
    const String systemPrompt = """
    You are a task extractor. Extract task details from the transcript into a JSON object.
    Required Keys:
    - "task": (String) A clear title of the action.
    - "assignee_name": (String) The name of the person mentioned.
    - "due_date": (String) The date in YYYY-MM-DD format. If no year is mentioned, assume 2026.
    
    Only return valid JSON. No conversational text.
  """;
    try {
      final response = await client.dio.post(
        ApiEndpoints.generateContent,
        queryParameters: {"key": apiKey},
        data: {
          "contents": [
            {
              "role": "user",
              "parts": [
                {"text": "System Instruction: $systemPrompt"},
                {"text": "Transcript: $transcript"},
              ],
            },
          ],
        },
      );

      print("RAW RESPONSE: ${response.data}");

      final String rawText =
          response.data['candidates'][0]['content']['parts'][0]['text'];

      print("RAW TEXT: $rawText");

      final cleaned = rawText
          .replaceAll("```json", "")
          .replaceAll("```", "")
          .trim();

      print("CLEANED JSON: $cleaned");

      return jsonDecode(cleaned);
    } on DioException catch (e) {
      print("🔥 STATUS CODE: ${e.response?.statusCode}");
      print("🔥 ERROR DATA: ${e.response?.data}");
      rethrow;
    } catch (e, stack) {
      print("🔥 UNKNOWN ERROR: $e");
      print(stack);
      rethrow;
    }
  }
}
