part of 'movie_cubit.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final String recommendation;

  MovieLoaded(this.recommendation);
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
