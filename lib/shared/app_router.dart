import 'package:flutter/material.dart';
import 'package:sinric_app/presentaion%20layer/screens/drawer_inner_screen/drawer_rooms/drawer_rooms_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/forget_password/forget_pass_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/home/home_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/login/login_view.dart';
import 'package:sinric_app/presentaion%20layer/screens/register/register_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/splash_screen.dart';

import '../presentaion layer/screens/drawer_inner_screen/account/account_screen.dart';

class AppRoutes {
  static const String loginScreenRoute = 'loginScreen';
  static const String splashScreenRoute = 'splashScreen';
  static const String registerScreenRoute = 'registerScreen';
  static const String forgetPassScreenRoute = 'forgetPassScreen';
  static const String homeScreenRoute = 'homeScreen';
  static const String accountScreenRoute = 'accountScreen';
  static const String drawerRoomsScreenRoute = 'drawerRoomsScreen';
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

      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.accountScreenRoute:
        return MaterialPageRoute(builder: (_) => const AccountScreen());

      case AppRoutes.drawerRoomsScreenRoute:
        return MaterialPageRoute(builder: (_) => const DrawerRoomsScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
