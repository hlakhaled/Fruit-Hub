import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = "SignUp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "حساب جديد"),
      body: SignUpBody(),
    );
  }
}
