import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/service/database_service.dart';

class FirestoreService implements DatabaseService {
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String uid,
  }) async {
    await FirebaseFirestore.instance.collection(path).doc(uid).set(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uid,
  }) async {
    final userData = await FirebaseFirestore.instance
        .collection(path)
        .doc(uid)
        .get();
    return userData.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExist({
    required String path,
    required String uid,
  }) async {
    final userData = await FirebaseFirestore.instance
        .collection(path)
        .doc(uid)
        .get();
    return userData.exists;
  }
}
