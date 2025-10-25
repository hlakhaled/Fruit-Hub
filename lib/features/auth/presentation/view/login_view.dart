import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = "Login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "تسجبل الدخول"),
      body: LoginViewBody(),
    );
  }
}
