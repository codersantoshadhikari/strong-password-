import 'package:flutter/material.dart';
// import 'package:nepali_fortify/home/screen/home_screen.dart';
import 'package:nepali_fortify/passwordgen.dart';
import 'package:nepali_fortify/routes/routes.dart';
import 'package:nepali_fortify/savescreen.dart';
import 'package:nepali_fortify/splash_screen/screen/splash_screen.dart';

class RouteHandler {
  static Route<dynamic>? handlerRoute(RouteSettings settings) {
    final routeName = settings.name;
    // ignore: unused_local_variable
    final arg = settings.arguments;
    switch (routeName) {
      case Routes.splashScreen:
        return MaterialPageRoute<void>(
            builder: (_) => const SplashScreen(), settings: settings);
      // case Routes.homeScreen:
      //   return MaterialPageRoute<void>(
      //       builder: (_) => const HomeScreen(), settings: settings);
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
