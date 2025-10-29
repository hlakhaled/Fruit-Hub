import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required this.authRepo}) : super(ForgotPasswordInitial());
  final AuthRepo authRepo;
  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgotPasswordLoading());
    var result = await authRepo.sendPasswordResetEmail(email);
    result.fold(
      (l) => emit(ForgotPasswordFailure(message: l.errorMsg)),
      (r) => emit(ForgotPasswordSuccess()),
    );
  }
}
