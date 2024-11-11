import 'package:flutter/material.dart';

class TColors {
  TColors._();

/* -- LIST OF ALL COLORS -- */

// App Colors

  static const Color primary = Color(0xFFA00505);
  static const Color secondary = Color(0xFFFF0947E5);
  static const Color accent = Color(0xFFb0c7ff);

  // -- TEXT COLORS

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  // -- GRADIENT COLORS

  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
    Color(0xffff9a9e),
    Color(0xfffad0c4),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:135058454.
    Color(0xfff5f5f5),
  ]);

  // -- BACKGROUND COLORS
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // -- BACKGROUND CONTAINER COLORS

  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);
  static const Color primaryContainer = Color(0xFFF3F5FF);

// -- ON-BOARDING COLORS
  static const tOnBoardingPage1Color = Colors.white;
  static const tOnBoardingPage2Color = Color(0xfffddcdf);
  static const tOnBoardingPage3Color = Color(0xffffdcbd);

  // -- BUTTOM COLORS

  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonAccent = Color(0xFFC4C4C4);

  // -- BORDER COLORS

  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
  static const Color borderAccent = Color(0xFFC4C4C4);

// -- ERROR AND VALIDATION COLORS
  static const Color error = Color(0xFFF44336);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  // -- NEUTRAL COLORS
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color drakGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
}
