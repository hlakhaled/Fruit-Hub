import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_hub/features/splash_view/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView());

    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
