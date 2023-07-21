import 'package:flutter/material.dart';
import 'package:strong_password_generator/home/screen/home_screen.dart';
import 'package:strong_password_generator/passwordgen.dart';
import 'package:strong_password_generator/routes/routes.dart';
import 'package:strong_password_generator/savescreen.dart';
import 'package:strong_password_generator/splash_screen/screen/splash_screen.dart';

class RouteHandler {
  static Route<dynamic>? handlerRoute(RouteSettings settings) {
    final routeName = settings.name;
    // ignore: unused_local_variable
    final arg = settings.arguments;
    switch (routeName) {
      case Routes.splashScreen:
        return MaterialPageRoute<void>(
            builder: (_) => const SplashScreen(), settings: settings);
      case Routes.homeScreen:
        return MaterialPageRoute<void>(
            builder: (_) => const HomeScreen(), settings: settings);
      case Routes.passwordGenerationScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordGeneratorScreen(),
            settings: settings);
      case Routes.saveGeneratedPassWordScreen:
        return MaterialPageRoute(
            builder: (_) => const SaveScreen(), settings: settings);
      default:
        return MaterialPageRoute<void>(
            builder: ((_) => const SplashScreen()), settings: settings);
    }
  }
}
