import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/core/services/watchlist_database_service.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/watchlist/domain/repos/watchlist_repo.dart';

class WatchlistRepoImpl implements WatchlistRepo {
  final WatchlistDatabaseService watchListDatabaseService;

  WatchlistRepoImpl({required this.watchListDatabaseService});

  @override
  Future<void> addToWatchlist({
    required MovieEntity movieEntity,
    required String uID,
  }) async {
    await watchListDatabaseService.addData(
      path: uID,
      data: movieEntity.toMap(),
      docID: movieEntity.id.toString(),
    );
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getWatchlist({
    required String uID,
  }) async {
    try {
      List<MovieEntity> result = await watchListDatabaseService.getData(
        path: uID,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> removeFromWatchlist({
    required String movieID,
    required String uID,
  }) async {
    await watchListDatabaseService.deleteData(path: uID, docID: movieID);
  }
}
