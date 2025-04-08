import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit(this.watchlistRepo) : super(WatchlistInitial());
  final WatchlistRepo watchlistRepo;

  List<MovieEntity> movies = [];
  Future<void> getWatchlistMovies() async {
    emit(WatchListLoading());
    final result = await watchlistRepo.getWatchlist(
      uID: FirebaseAuth.instance.currentUser!.uid,
    );
    movies = result.fold((l) => [], (r) => r);
    result.fold(
      (failure) => emit(WatchListError(message: failure.message)),
      (movies) => emit(WatchListSuccess(movies: movies)),
    );
  }
}
