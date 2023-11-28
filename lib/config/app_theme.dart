import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/local_storage.dart';
import 'themes/app_colors.dart';

class AppTheme {
  static final theme = Rx<ThemeMode>(ThemeMode.system);
  static LocalStorage preferences = LocalStorage();

  static Future<void> initTheme() async {
    await preferences.init();
    final savedTheme = preferences.getString('themeMode');

    if (savedTheme == 'light') {
      theme.value = ThemeMode.light;
    } else if (savedTheme == 'dark') {
      theme.value = ThemeMode.light;
    } else {
      theme.value = ThemeMode.light; // Set to system theme by default
    }
  }

  static void changeThemeMode(ThemeMode mode) {
    theme.value = mode;
    preferences.setString('themeMode', mode.toString());
    Get.changeThemeMode(theme.value);
  }

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryBlueColor,
    primaryColorLight: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    iconTheme: const IconThemeData(color: AppColors.primaryDarkColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF2B2A29),
        fontSize: 32,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF2B2A29),
        fontSize: 15,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF2B2A29),
        fontSize: 22,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.primaryDarkColor,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.black)),
    colorScheme: const ColorScheme(
      background: AppColors.whiteColor,
      brightness: Brightness.light,
      primary: AppColors.whiteColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.whiteColor,
      onSecondary: AppColors.whiteColor,
      error: Colors.red,
      onError: AppColors.whiteColor,
      onBackground: AppColors.whiteColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.whiteColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDarkColor,
    primaryColorLight: AppColors.appBackgroundColors,
    scaffoldBackgroundColor: AppColors.appBackgroundColors,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
      ),
    ),
    colorScheme: const ColorScheme(
      background: AppColors.primaryDarkColor,
      brightness: Brightness.dark,
      primary: AppColors.primaryDarkColor,
      onPrimary: AppColors.primaryDarkColor,
      secondary: AppColors.primaryDarkColor,
      onSecondary: AppColors.primaryDarkColor,
      error: Colors.red,
      onError: AppColors.whiteColor,
      onBackground: AppColors.primaryDarkColor,
      surface: AppColors.primaryDarkColor,
      onSurface: AppColors.primaryDarkColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDarkColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.white)),
  );
}
