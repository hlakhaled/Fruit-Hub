import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/domain/entities/auth_entity.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

final class LoginSuccess extends LoginState {
  AuthEntity authEntity;
 LoginSuccess({required this.authEntity});
}
