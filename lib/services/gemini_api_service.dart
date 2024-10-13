import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiApiService {
  final String apiKey;

  GeminiApiService(this.apiKey);

  // Method to generate content using the Gemini API
  Future<String> generateContent(String prompt) async {
    // Create a model instance
    final model = GenerativeModel(
      model: 'gemini-1.5-flash', // You can replace this with the desired model
      apiKey: apiKey,
    );

    // Create content with the given prompt
    final response = await model.generateContent([Content.text(prompt)]);

    // Check if the response text is null and return a default value if necessary
    if (response.text == null) {
      return 'No content generated'; // Or any other fallback string you want
    }

    // Return the generated text
    return response.text ?? 'No content generated';
  }
}
