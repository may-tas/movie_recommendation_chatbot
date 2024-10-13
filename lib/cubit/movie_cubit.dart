import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation_chatbot/services/gemini_api_service.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GeminiApiService _geminiApiService;

  MovieCubit(this._geminiApiService) : super(MovieInitial());

  Future<void> getMovieRecommendation(String diaryEntry) async {
    emit(MovieLoading());
    try {
      // Call Gemini API for a movie recommendation
      String recommendation =
          await _geminiApiService.generateContent(diaryEntry);
      emit(MovieLoaded(recommendation));
    } catch (error) {
      emit(MovieError(error.toString()));
    }
  }
}
