import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vocado/core/network/dio_client.dart';

extension GeminiExtension on DioClient {
  Future<Map<String, dynamic>> generateTask(String transcript) async {
    final apiKey = dotenv.env['gemini_key'];

    final response = await dio.post(
      'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=$apiKey',
      data: {
        "contents": [
          {
            "parts": [
              {
                "text":
                    """
You are a task extraction system.

Convert this text into STRICT JSON only:

Text:
$transcript

Return format:
{
  "task": "",
  "assignee": "",
  "due_date": ""
}
""",
              },
            ],
          },
        ],
      },
    );

    final rawText =
        response.data['candidates'][0]['content']['parts'][0]['text'];

    final cleaned = rawText
        .replaceAll("```json", "")
        .replaceAll("```", "")
        .trim();

    return jsonDecode(cleaned);
  }
}
