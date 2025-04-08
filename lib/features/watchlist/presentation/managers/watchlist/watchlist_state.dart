part of 'watchlist_cubit.dart';

abstract class WatchlistState {}

final class WatchlistInitial extends WatchlistState {}

final class WatchListLoading extends WatchlistState {}

final class WatchListSuccess extends WatchlistState {
  final List<MovieEntity> movies;
  WatchListSuccess({required this.movies});
}

final class WatchListError extends WatchlistState {
  final String message;
  WatchListError({required this.message});
}
