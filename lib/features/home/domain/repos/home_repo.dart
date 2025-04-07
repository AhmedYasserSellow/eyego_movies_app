import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies({
    required String apiKey,
  });
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies({
    required String apiKey,
  });
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies({
    required String apiKey,
  });
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies({
    required String apiKey,
  });
}
