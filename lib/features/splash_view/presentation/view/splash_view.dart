import 'package:flutter/material.dart';
import 'package:fruit_hub/features/splash_view/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = "splash_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
