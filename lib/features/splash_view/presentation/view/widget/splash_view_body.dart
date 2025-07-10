import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/service/preference_manager.dart';
import 'package:fruit_hub/core/utils/constants/assets.dart';
import 'package:fruit_hub/features/auth/presentation/view/login_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excutionNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(Assets.assetsImagesLeaves)],
        ),

        SvgPicture.asset(Assets.assetsImagesSplashIcon),
        SvgPicture.asset(Assets.assetsImagesBubbles, fit: BoxFit.fill),
      ],
    );
  }

  void excutionNavigation() {
    Future.delayed(Duration(seconds: 3), () {
      bool value = PreferenceManager.getBool(key: "on Boarding view");

      Navigator.pushReplacementNamed(
        context,
        value == false ? OnBoardingView.routeName : LoginView.routeName,
      );
    });
  }
}
