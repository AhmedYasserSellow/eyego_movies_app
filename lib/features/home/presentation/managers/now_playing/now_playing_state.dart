part of 'now_playing_cubit.dart';

abstract class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingSuccess extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingSuccess({required this.movies});
}

final class NowPlayingError extends NowPlayingState {
  final String message;
  NowPlayingError({required this.message});
}
