import 'package:flutter/material.dart';
import 'package:sinric_app/shared/color_manager.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      drawerTheme: DrawerThemeData(
        backgroundColor:
            isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: ColorManager.primary),
      ),
      scaffoldBackgroundColor:
          //0A1931  // white yellow 0xFFFCF8EC
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      primaryColor: Colors.deepOrange,
      primarySwatch: Colors.deepOrange,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
