import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/auth_entity.dart';

class UserModel extends AuthEntity {
  UserModel({required super.email, required super.name, required super.uid});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uid: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      name: json["name"],
      uid: json["uid"],
    );
  }
}
