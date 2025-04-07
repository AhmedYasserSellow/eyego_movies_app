import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit(this.homeRepo) : super(UpcomingInitial());
  final HomeRepo homeRepo;

  Future<void> getUpcomingMovies() async {
    emit(UpcomingLoading());
    final result = await homeRepo.getUpcomingMovies(apiKey: apikey);
    result.fold(
      (failure) => emit(UpComingError(message: failure.message)),
      (movies) => emit(UpcomingSuccess(movies: movies)),
    );
  }
}
