
import 'package:authentech/utils/theme/widget/appbar_theme.dart';
import 'package:authentech/utils/theme/widget/bottom_sheet_theme.dart';
import 'package:authentech/utils/theme/widget/checkbox_theme.dart';
import 'package:authentech/utils/theme/widget/chip_theme.dart';
import 'package:authentech/utils/theme/widget/elevated_button_theme.dart';
import 'package:authentech/utils/theme/widget/outlined_button_theme.dart';
import 'package:authentech/utils/theme/widget/text_field_theme.dart';
import 'package:authentech/utils/theme/widget/text_theme.dart';
import 'package:flutter/material.dart';


class TAppTheme {

  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
    
      brightness: Brightness.light,
      textTheme: 
      TTextTheme.lightTextTheme,
      primaryColor: Colors.blue,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
      chipTheme: TChipTheme.lightChipTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      scaffoldBackgroundColor: Colors.white,
      checkboxTheme: TCheckboxTheme.ligthCheckboxTheme,
      bottomSheetTheme: TBottonSheetTheme.ligthBottomSheetTheme,
      );

  static ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  textTheme: 
  TTextTheme.darkTextTheme,
  outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  chipTheme: TChipTheme.darkChipTheme,
  appBarTheme: TAppBarTheme.darkAppBarTheme,
  scaffoldBackgroundColor: Colors.black,
  checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
  bottomSheetTheme: TBottonSheetTheme.darkBottomSheetTheme,
  );
}
