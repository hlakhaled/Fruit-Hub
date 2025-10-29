abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String uid,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uid,
  });

  Future<bool> checkIfDataExist({required String path, required String uid});
}
