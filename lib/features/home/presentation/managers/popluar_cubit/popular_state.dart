part of 'popular_cubit.dart';

abstract class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularSuccess extends PopularState {
  final List<MovieEntity> movies;
  PopularSuccess({required this.movies});
}

final class PopularError extends PopularState {
  final String message;
  PopularError({required this.message});
}
