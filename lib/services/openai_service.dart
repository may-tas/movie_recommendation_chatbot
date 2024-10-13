import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIService {
  final String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  // Method to create chat completion
  Future<String> createChatCompletion(
      List<Map<String, String>> messages, String model) async {
    // Ensure the API key is loaded from .env
    final apiKey = dotenv.env['OPENAI_API_KEY'];

    // Prepare headers
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    // Prepare the request body
    final body = jsonEncode({
      'model': model,
      'messages': messages,
    });

    // Make the HTTP POST request
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: body,
      );

      // Check for a successful response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['choices'][0]['message']
            ['content']; // Extract the assistant's message
      } else {
        throw Exception(
            'Failed to get response: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Error occurred while making request: $e');
    }
  }
}
