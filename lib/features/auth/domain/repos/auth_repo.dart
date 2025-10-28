import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/features/auth/domain/entities/auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  AuthRepo();
  Future<Either<Failure, AuthEntity>> createUser(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, AuthEntity>> loginUser(String email, String password);
  Future<Either<Failure, AuthEntity>> signInWithGoogle();
    Future<Either<Failure, AuthEntity>> signInWithFacebook();
}
