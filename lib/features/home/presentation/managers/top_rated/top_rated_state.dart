part of 'top_rated_cubit.dart';

abstract class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {
  final List<MovieEntity> movies;
  TopRatedSuccess({required this.movies});
}

final class TopRatedError extends TopRatedState {
  final String message;
  TopRatedError({required this.message});
}
