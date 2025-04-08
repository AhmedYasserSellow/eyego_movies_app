import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyego_movies_app/core/services/watchlist_database_service.dart';
import 'package:eyego_movies_app/features/home/data/models/movie_model.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

class FirebaseDatasource implements WatchlistDatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docID,
  }) async {
    if (docID != null) {
      await firestore.collection(path).doc(docID).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<void> deleteData({required String path, required String docID}) async {
    await firestore.collection(path).doc(docID).delete();
  }

  @override
  Future<List<MovieEntity>> getData({required String path}) async {
    final result = await firestore.collection(path).get();
    return result.docs.map((doc) {
      final data = doc.data();
      return MovieModel.fromJson(data);
    }).toList();
  }
}
