part of 'search_cubit.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<MovieEntity> movies;
  SearchSuccess({required this.movies});
}

final class SearchError extends SearchState {
  final String message;
  SearchError({required this.message});
}
