import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/core/services/movie_api_service.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final MovieApiService movieApiService;
  HomeRepoImpl({required this.movieApiService});
  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies({
    required String apiKey,
  }) async {
    try {
      List<MovieEntity> result = await movieApiService.getNowPlaying(
        apiKey: apiKey,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies({
    required String apiKey,
  }) async {
    try {
      List<MovieEntity> result = await movieApiService.getPopular(
        apiKey: apiKey,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies({
    required String apiKey,
  }) async {
    try {
      List<MovieEntity> result = await movieApiService.getTopRated(
        apiKey: apiKey,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies({
    required String apiKey,
  }) async {
    try {
      List<MovieEntity> result = await movieApiService.getUpcoming(
        apiKey: apiKey,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
