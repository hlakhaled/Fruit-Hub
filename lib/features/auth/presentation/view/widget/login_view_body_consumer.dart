import 'package:flutter/material.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        ScaffoldMessenger,
        Text,
        SnackBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/manager/Auth/auth_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/login_view_body.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyConsumer extends StatelessWidget {
  const LoginViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is AuthSuccess) {}
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AuthLoading ? true : false,
            child: LoginViewBody(),
          );
        },
      ),
    );
  }
}
