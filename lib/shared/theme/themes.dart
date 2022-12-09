import 'package:flutter/material.dart';
import 'package:sinric_app/shared/color_manager.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'pro',
  primaryColor: ColorManager.primary,
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: ColorManager.primary,
    ),
  ),
);
