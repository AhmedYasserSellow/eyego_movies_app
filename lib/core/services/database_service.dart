abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docID,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String docID,
  });

  Future<bool> checkIfDataExists({required String path, required String docID});
}
