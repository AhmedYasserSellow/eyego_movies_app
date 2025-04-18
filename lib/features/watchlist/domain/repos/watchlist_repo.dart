import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

abstract class WatchlistRepo {
  Future<void> addToWatchlist({
    required MovieEntity movieEntity,
    required String uID,
  });
  Future<void> removeFromWatchlist({
    required String movieID,
    required String uID,
  });

  Future<Either<Failure, List<MovieEntity>>> getWatchlist({
    required String uID,
  });
}
