import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiApiService {
  final String apiKey;

  GeminiApiService(this.apiKey);

  Future<String> generateContent(String prompt) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );

    final response = await model.generateContent([
      Content.text(
          "Give Real movie recommendations based on this description : $prompt")
    ]);

    // Return the generated text
    return response.text ?? 'No content generated';
  }
}
