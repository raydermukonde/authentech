import 'package:authentech/utils/constants/colors.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                   foregroundColor: TColors.buttonPrimary,
                   side: const BorderSide(
                    color: TColors.buttonPrimary,
                   ),
                   padding: const EdgeInsets.symmetric(vertical: TSize.tButtonHeight),

                  ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                   foregroundColor: TColors.white,
                   side: const BorderSide(
                    color: TColors.white,
                   ),
                   padding: const EdgeInsets.symmetric(vertical: TSize.tButtonHeight),

                  ),
  );
}
