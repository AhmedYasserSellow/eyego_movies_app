import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/core/services/watchlist_database_service.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WatchlistRepoImpl implements WatchlistRepo {
  final WatchlistDatabaseService watchListDatabaseService;

  WatchlistRepoImpl({required this.watchListDatabaseService});

  final String userID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> addToWatchlist({required MovieEntity movieEntity}) async {
    await watchListDatabaseService.addData(
      path: userID,
      data: movieEntity.toMap(),
      docID: movieEntity.id.toString(),
    );
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getWatchlist() async {
    try {
      List<MovieEntity> result = await watchListDatabaseService.getData(
        path: userID,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> removeFromWatchlist({required String movieID}) async {
    await watchListDatabaseService.deleteData(path: userID, docID: movieID);
  }
}
