import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.homeRepo) : super(NowPlayingInitial());
  final HomeRepo homeRepo;

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingLoading());
    final result = await homeRepo.getNowPlayingMovies(apiKey: apikey);
    result.fold(
      (failure) => emit(NowPlayingError(message: failure.message)),
      (movies) => emit(NowPlayingSuccess(movies: movies)),
    );
  }
}
