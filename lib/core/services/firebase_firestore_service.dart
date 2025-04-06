import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyego_movies_app/core/services/database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docID,
  }) async {
    if (docID != null) {
      await _instance.collection(path).doc(docID).set(data);
    } else {
      await _instance.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docID,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _instance.collection(path).doc(docID).get();
    return documentSnapshot.data()!;
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docID,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _instance.collection(path).doc(docID).get();
    return documentSnapshot.exists;
  }
}
