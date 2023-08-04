import 'package:flutter/material.dart';
// import 'package:fast_pw_manager/home/screen/home_screen.dart';
import 'package:flash_pw_manager/password_gen/screen/passwordgen.dart';
import 'package:flash_pw_manager/routes/routes.dart';
import 'package:flash_pw_manager/saved_password_view/screen/savescreen.dart';
import 'package:flash_pw_manager/splash_screen/screen/splash_screen.dart';

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
            builder: (_) => const SaveedPasswordScreenWidget(), settings: settings);
      default:
        return MaterialPageRoute<void>(
            builder: ((_) => const SplashScreen()), settings: settings);
    }
  }
}
