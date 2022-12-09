import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../notification_services/localization/applocal.dart';
import '../../notification_services/notification_service.dart';
import '../../shared/app_router.dart';
import '../../shared/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute);
    });
  }

  @override
  void initState() {
    super.initState();
    NotifyHelper notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.displayNotification(
      title: "Welcome in castle black tech",
      body: 'I hope you like our app',
    );
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 180.h),
            Image.asset(
              'assets/images/splash.png',
              height: 200.h,
              width: 200.w,
            ),
            SizedBox(height: 20.h),
            TextLiquidFill(
              text: getLang(context, "Castle_Black_Tech"),
              waveColor: ColorManager.primary,
              boxBackgroundColor: Colors.white,
              loadDuration: const Duration(seconds: 3),
              loadUntil: 1,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0.sp,
              ),
              boxHeight: 300.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
