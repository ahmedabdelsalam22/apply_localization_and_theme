import 'package:flutter/material.dart';
import 'package:sinric_app/presentaion%20layer/screens/forget_password/forget_pass_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/login/login_view.dart';
import 'package:sinric_app/presentaion%20layer/screens/register/register_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/splash_screen.dart';

class AppRoutes {
  static const String loginScreenRoute = 'loginScreen';
  static const String splashScreenRoute = 'splashScreen';
  static const String registerScreenRoute = 'registerScreen';
  static const String forgetPassScreenRoute = 'forgetPassScreen';
}

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case AppRoutes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case AppRoutes.forgetPassScreenRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
