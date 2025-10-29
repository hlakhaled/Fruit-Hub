import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/core/service/firestore_service.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/manager/Auth/auth_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/manager/ForgotPassword/forgot_password_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

class GetItServices {
  final getIt = GetIt.instance;
  void setup() {
    getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
    getIt.registerSingleton<FirestoreService>(FirestoreService());
    getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(
        firebaseAuthService: getIt<FirebaseAuthService>(),
        firestoreService: getIt<FirestoreService>(),
      ),
    );
    getIt.registerSingleton<AuthCubit>(AuthCubit(authRepo: getIt<AuthRepo>()));
    getIt.registerSingleton<LoginCubit>(
      LoginCubit(authRepo: getIt<AuthRepo>()),
    );
    getIt.registerSingleton<ForgotPasswordCubit>(
      ForgotPasswordCubit(authRepo: getIt<AuthRepo>()),
    );
  }
}
