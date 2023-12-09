import 'package:flutter/material.dart';
import 'package:pharmalink/presentation/screens/change_password_screens/forget_password_screen.dart';
import 'package:pharmalink/presentation/screens/change_password_screens/new_password_screen.dart';
import 'package:pharmalink/presentation/screens/change_password_screens/verfication_code_screen.dart';
import 'package:pharmalink/presentation/screens/home_screen.dart';
import 'package:pharmalink/presentation/screens/log_in_screen.dart';
import 'package:pharmalink/presentation/screens/register_screen.dart';
import 'package:pharmalink/presentation/screens/splash_screen.dart';


class AppRoute {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );


      case HomeScreen.route:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );


      case LogInScreen.route:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
        );


      case RegisterScreen.route:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );


      case ForgetPasswordScreen.route:
        return MaterialPageRoute(
            builder: (_) => const ForgetPasswordScreen(),
        );


      case VerficationCodeScreen.route:
        return MaterialPageRoute(
          builder: (_) => const VerficationCodeScreen(),
        );


      case NewPasswordScreen.route:
        return MaterialPageRoute(
          builder: (_) => const NewPasswordScreen(),
        );


      default:
        return null;
    }
  }
}