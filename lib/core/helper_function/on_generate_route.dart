import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/view/forgot_password.dart';
import 'package:fruit_hub/features/auth/presentation/view/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/view/reset_password_view.dart';
import 'package:fruit_hub/features/auth/presentation/view/sign_up_view.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/forgot_password_body.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_hub/features/splash_view/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());
    case ForgotPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => ForgotPasswordView());
    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => ResetPasswordView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
