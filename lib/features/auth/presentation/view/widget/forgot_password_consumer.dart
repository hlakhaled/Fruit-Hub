import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/manager/ForgotPassword/forgot_password_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/forgot_password_body.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordConsumer extends StatelessWidget {
  const ForgotPasswordConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ForgotPasswordCubit>(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is ForgotPasswordSuccess) {
            // Navigator.pushReplacementNamed(context, SignUpView.routeName);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ForgotPasswordLoading ? true : false,
            child: ForgotPasswordBody(),
          );
        },
      ),
    );
  }
}
