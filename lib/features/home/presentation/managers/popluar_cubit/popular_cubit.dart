import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.homeRepo) : super(PopularInitial());
  final HomeRepo homeRepo;

  Future<void> getPopularMovies() async {
    emit(PopularLoading());
    final result = await homeRepo.getPopularMovies(apiKey: apikey);
    result.fold(
      (failure) => emit(PopularError(message: failure.message)),
      (movies) => emit(PopularSuccess(movies: movies)),
    );
  }
}
