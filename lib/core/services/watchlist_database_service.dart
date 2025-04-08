import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

abstract class WatchlistDatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docID,
  });

  Future<void> deleteData({required String path, required String docID});

  Future<List<MovieEntity>> getData({required String path});
}
