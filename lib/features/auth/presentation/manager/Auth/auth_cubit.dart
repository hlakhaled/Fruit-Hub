import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/entities/auth_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void> createUserCubit({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.createUser(email, password, name);
    result.fold(
      (l) => emit(AuthFailure(message: l.errorMsg)),
      (r) => emit(AuthSuccess(authEntity: r)),
    );
  }

  Future<void> loginCubit({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.loginUser(email, password);
    result.fold(
      (l) => emit(AuthFailure(message: l.errorMsg)),
      (r) => emit(AuthSuccess(authEntity: r)),
    );
  }
}
