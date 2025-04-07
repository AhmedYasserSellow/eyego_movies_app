import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/core/services/movie_api_service.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final MovieApiService movieApiService;
  SearchRepoImpl({required this.movieApiService});
  @override
  Future<Either<Failure, List<MovieEntity>>> getSearchFiltredMovies({
    required String apiKey,
    required String query,
    required String? genre,
  }) async {
    try {
      List<MovieEntity> result = await movieApiService.getSearchMovieByName(
        apiKey: apiKey,
        query: query,
      );
      if (genre != null) {
        result = result.where((movie) => movie.genre == genre).toList();
      }
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
