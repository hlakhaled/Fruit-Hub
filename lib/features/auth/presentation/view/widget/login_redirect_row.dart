
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/view/login_view.dart';

class LoginRedirectRow extends StatelessWidget {
  const LoginRedirectRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "تمتلك حساب بالفعل؟",
          style: Styles.semiBold16.copyWith(color: AppColors.gray400),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              LoginView.routeName,
            );
          },
          child: Text(
            " تسجيل دخول",
            style: Styles.semiBold16.copyWith(
              color: AppColors.green700,
            ),
          ),
        ),
      ],
    );
  }
}
