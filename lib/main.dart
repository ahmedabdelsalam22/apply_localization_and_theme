import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinric_app/core/app_router/app_router.dart';
import 'package:sinric_app/presentaion%20layer/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'pro',
              primaryColor: Colors.deepOrange,
              primarySwatch: Colors.deepOrange),
          home: const SplashScreen(),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.splashScreenRoute,
        );
      },
    );
  }
}
