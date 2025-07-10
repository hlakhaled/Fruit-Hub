import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/helper_function/on_generate_route.dart';
import 'package:fruit_hub/core/service/preference_manager.dart';
import 'package:fruit_hub/features/splash_view/presentation/view/splash_view.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale("ar"),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
