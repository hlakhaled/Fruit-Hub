import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/forgot_password_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const routeName = "forgotPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "نسيان كلمة المرور"),
    body: ForgotPasswordBody(),
    );
  }
}
