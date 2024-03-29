import 'package:flutter/material.dart';
import 'package:sinric_app/presentaion%20layer/screens/drawer_inner_screen/drawer_activity_log/drawer_activity_log_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/drawer_inner_screen/drawer_rooms/drawer_rooms_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/forget_password/forget_pass_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/home/home_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/login/login_screen.dart';
import 'package:sinric_app/presentaion%20layer/screens/register/register_screen.dart';

import '../presentaion layer/screens/bottom_sheet_inner_screen/bottom_sheet_room_screen.dart';
import '../presentaion layer/screens/bottom_sheet_inner_screen/bottom_sheet_scene_screen.dart';
import '../presentaion layer/screens/drawer_inner_screen/drawer_account/account_screen.dart';
import '../presentaion layer/screens/drawer_inner_screen/drawer_scenes/drawer_scenes_screen.dart';
import '../presentaion layer/screens/drawer_inner_screen/drawer_schedules/drawer_add_new_schedules_screen.dart';
import '../presentaion layer/screens/drawer_inner_screen/drawer_schedules/drawer_schedules_screen.dart';
import '../presentaion layer/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String loginScreenRoute = 'loginScreen';
  static const String splashScreenRoute = 'splashScreen';
  static const String registerScreenRoute = 'registerScreen';
  static const String forgetPassScreenRoute = 'forgetPassScreen';
  static const String homeScreenRoute = 'homeScreen';
  static const String accountScreenRoute = 'accountScreen';
  static const String drawerRoomsScreenRoute = 'drawerRoomsScreen';
  static const String drawerScenesScreenRoute = 'drawerScenesScreen';
  static const String drawerSchedulesScreenRoute = 'drawerSchedulesScreen';
  static const String drawerActivityLogScreenRoute = 'drawerActivityLogScreen';
  static const String drawerAddNewSchedulesScreenRoute =
      'drawerAddNewSchedulesScreen';
  static const String bottomSheetAddRoomScreenRoute =
      'bottomSheetAddRoomScreen';
  static const String bottomSheetAddSceneScreenRoute =
      'bottomSheetAddSceneScreen';
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

      case AppRoutes.drawerScenesScreenRoute:
        return MaterialPageRoute(builder: (_) => const DrawerScenesScreen());

      case AppRoutes.drawerSchedulesScreenRoute:
        return MaterialPageRoute(builder: (_) => const DrawerSchedulesScreen());

      case AppRoutes.drawerActivityLogScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const DrawerActivityLogScreen());

      case AppRoutes.drawerAddNewSchedulesScreenRoute:
        return MaterialPageRoute(builder: (_) => DrawerAddNewSchedulesScreen());

      case AppRoutes.bottomSheetAddRoomScreenRoute:
        return MaterialPageRoute(builder: (_) => BottomSheetAddRoomScreen());

      case AppRoutes.bottomSheetAddSceneScreenRoute:
        return MaterialPageRoute(builder: (_) => BottomSheetAddSceneScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
