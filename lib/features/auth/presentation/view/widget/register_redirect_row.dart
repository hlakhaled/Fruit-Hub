
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/view/sign_up_view.dart';

class RegisterRedirectRow extends StatelessWidget {
  const RegisterRedirectRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "لا تمتلك حساب؟",
          style: Styles.semiBold16.copyWith(color: AppColors.gray400),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              SignUpView.routeName,
            );
          },
          child: Text(
            " قم بإنشاء حساب",
            style: Styles.semiBold16.copyWith(
              color: AppColors.green700,
            ),
          ),
        ),
      ],
    );
  }
}
