import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/manager/LoginCubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> loginCubit({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await authRepo.loginUser(email, password);
    result.fold(
      (l) => emit(LoginFailure(message: l.errorMsg)),
      (r) => emit(LoginSuccess(authEntity: r)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (l) => emit(LoginFailure(message: l.errorMsg)),
      (r) => emit(LoginSuccess(authEntity: r)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (l) => emit(LoginFailure(message: l.errorMsg)),
      (r) => emit(LoginSuccess(authEntity: r)),
    );
  }

}
