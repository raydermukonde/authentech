import 'package:authentech/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3894185805.
      displayLarge: GoogleFonts.montserrat(
        color: TColors.dark,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,),
      displayMedium: GoogleFonts.montserrat(
        color: TColors.dark,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,),
      displaySmall: GoogleFonts.poppins(
        color: TColors.dark,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,),
      headlineLarge: GoogleFonts.poppins(
        color: TColors.dark,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,),
      headlineMedium: GoogleFonts.poppins(
        color: TColors.dark,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,),
      headlineSmall: GoogleFonts.poppins(
        color: TColors.dark,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,),
      bodyLarge: GoogleFonts.poppins(
        color: TColors.dark,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,),
      bodyMedium: GoogleFonts.poppins(
        color: TColors.dark,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,),    
  
        
        );
  static TextTheme darkTextTheme = TextTheme(
     displayLarge: GoogleFonts.montserrat(
        color: TColors.white,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,),
      displayMedium: GoogleFonts.montserrat(
        color: TColors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,),
      displaySmall: GoogleFonts.poppins(
        color: TColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,),
      headlineLarge: GoogleFonts.poppins(
        color: TColors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,),
      headlineMedium: GoogleFonts.poppins(
        color: TColors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,),
      headlineSmall: GoogleFonts.poppins(
        color: TColors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,),
      bodyLarge: GoogleFonts.poppins(
        color: TColors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,),
      bodyMedium: GoogleFonts.poppins(
        color: TColors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,),  
    );
}
