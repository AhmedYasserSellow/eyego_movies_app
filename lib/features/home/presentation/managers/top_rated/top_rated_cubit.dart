import 'package:eyego_movies_app/core/utils/env.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.homeRepo) : super(TopRatedInitial());
  final HomeRepo homeRepo;

  Future<void> getTopRatedMovies() async {
    emit(TopRatedLoading());
    final result = await homeRepo.getTopRatedMovies(apiKey: apikey);
    result.fold(
      (failure) => emit(TopRatedError(message: failure.message)),
      (movies) => emit(TopRatedSuccess(movies: movies)),
    );
  }
}
