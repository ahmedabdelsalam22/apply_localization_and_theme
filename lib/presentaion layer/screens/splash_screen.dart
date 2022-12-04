import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_router/app_router.dart';

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
              text: 'Castle Black Tech',
              waveColor: Colors.deepOrange,
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
