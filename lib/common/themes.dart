import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppThemes {
  static final ThemeData light = ThemeData(
    // useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    primarySwatch: const MaterialColor(
      0xff751217,
      <int, Color>{
        50: AppColors.primary,
        100: AppColors.primary,
        200: AppColors.primary,
        300: AppColors.primary,
        400: AppColors.primary,
        500: AppColors.primary,
        600: AppColors.primary,
        700: AppColors.primary,
        800: AppColors.primary,
        900: AppColors.primary,
      },
    ),
    drawerTheme: const DrawerThemeData(
      shadowColor: AppColors.black,
      backgroundColor: AppColors.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    dialogBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),
    textTheme: GoogleFonts.ralewayTextTheme(),
  );

  static final ThemeData dark = ThemeData(
    // useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkPrimary,
    primarySwatch: const MaterialColor(
      0xff0f0203,
      <int, Color>{
        50: AppColors.darkPrimary,
        100: AppColors.darkPrimary,
        200: AppColors.darkPrimary,
        300: AppColors.darkPrimary,
        400: AppColors.darkPrimary,
        500: AppColors.darkPrimary,
        600: AppColors.darkPrimary,
        700: AppColors.darkPrimary,
        800: AppColors.darkPrimary,
        900: AppColors.darkPrimary,
      },
    ),
    drawerTheme: const DrawerThemeData(
      shadowColor: AppColors.black,
      backgroundColor: AppColors.darkPrimary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkPrimary,
    ),
    dialogBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
    ),
    textTheme: GoogleFonts.ralewayTextTheme(),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.darkBackground),
      ),
    ),
  );
}
