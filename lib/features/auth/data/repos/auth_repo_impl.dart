import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/custom_exception.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/auth_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, AuthEntity>> createUser(
    String email,
    String password,
    String name,
  ) async {
    try {
      User user = await firebaseAuthService.createUser(email, password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(Failure(errorMsg: e.message));
    } catch (e) {
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
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(Failure(errorMsg: e.message));
    } catch (e) {
      return left(Failure(errorMsg: e.toString()));
    }
  }
}
