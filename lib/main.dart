import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_recommendation_chatbot/services/gemini_api_service.dart';
import 'package:movie_recommendation_chatbot/views/home_page.dart';
import 'cubit/movie_cubit.dart';
import 'dart:io';

void main() async {
  // Access the API key from environment variables
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
    print("Environment file loaded successfully!");
  } catch (e) {
    print("Error loading .env file: $e");
  }
  final apiKey = dotenv.env['API_KEY'];
  if (apiKey == null) {
    print('No \$API_KEY environment variable');
    exit(1);
  }

  // Initialize the GeminiApiService
  final geminiApiService = GeminiApiService(apiKey);

  runApp(MyApp(geminiApiService: geminiApiService));
}

class MyApp extends StatelessWidget {
  final GeminiApiService geminiApiService;

  const MyApp({super.key, required this.geminiApiService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => MovieCubit(geminiApiService),
        child: const HomePage(),
      ),
    );
  }
}
