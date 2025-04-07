import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/search/domain/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> getSearchFiltredMovies({
    required String query,
    required String? genre,
  }) async {
    Either<Failure, List<MovieEntity>> result = await searchRepo
        .getSearchFiltredMovies(apiKey: apikey, query: query, genre: genre);

    result.fold(
      (failure) => emit(SearchError(message: failure.message)),
      (movies) => emit(SearchSuccess(movies: movies)),
    );
  }
}
