import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/auth_entity.dart';

class UserModel extends AuthEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.password,
    required super.phone,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      password: '',
      phone: user.phoneNumber ?? '',
    );
  }
}
