import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieEntity>>> getSearchFiltredMovies({
    required String apiKey,
    required String query,
    required String? genre,
  });
}
