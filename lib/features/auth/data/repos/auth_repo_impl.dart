import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/custom_exception.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/core/service/firestore_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/auth_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.firestoreService,
  });

  @override
  Future<Either<Failure, AuthEntity>> createUser(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUser(email, password);

      final AuthEntity authEntity = UserModel.fromFirebaseUser(user);
      AuthEntity authEntity2 = AuthEntity(
        email: email,
        name: name,
        uid: user.uid,
      );
      await addData(authEntity: authEntity2);
      return right(authEntity);
    } on CustomException catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      return left(Failure(errorMsg: e.message));
    } catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> loginUser(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
      final data = firestoreService.getData(
        path: BackendEndpoints.addData,
        uid: user.uid,
      );
      print('data: $data');
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(Failure(errorMsg: e.message));
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      AuthEntity authEntity = UserModel.fromFirebaseUser(user);
      var isDataExist = await firestoreService.checkIfDataExist(
        path: BackendEndpoints.addData,
        uid: authEntity.uid,
      );
      if (isDataExist) {
        await getData(path: BackendEndpoints.addData, uid: authEntity.uid);
      } else {
        await addData(authEntity: authEntity);
      }
      return right(authEntity);
    } on CustomException catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      return left(Failure(errorMsg: e.message));
    } catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();

      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuthService.sendPasswordResetEmail(email);
      return right(unit);
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }

  @override
  Future addData({required AuthEntity authEntity}) async {
    await firestoreService.addData(
      path: BackendEndpoints.addData,
      data: authEntity.toMap(),
      uid: authEntity.uid,
    );
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uid,
  }) async {
    return await firestoreService.getData(path: path, uid: uid);
  }
}
