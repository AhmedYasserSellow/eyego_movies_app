part of 'upcoming_cubit.dart';

abstract class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoading extends UpcomingState {}

final class UpcomingSuccess extends UpcomingState {
  final List<MovieEntity> movies;
  UpcomingSuccess({required this.movies});
}

final class UpComingError extends UpcomingState {
  final String message;
  UpComingError({required this.message});
}
