
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/constants/assets.dart';
import 'package:fruit_hub/features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_outline_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOutlineButton(
          onpress: () {
            context.read<LoginCubit>().signInWithGoogle();
          },
          svgPicture: Assets.assetsImagesGoogle,
          title: "تسجيل بواسطة جوجل",
        ),
        SizedBox(height: 16),
    
        CustomOutlineButton(
          onpress: () {
            context.read<LoginCubit>().signInWithFacebook();
          },
          svgPicture: Assets.assetsImagesFacebook,
          title: "تسجيل بواسطة فيسبوك",
        ),
      ],
    );
  }
}
