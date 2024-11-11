
import 'package:authentech/features/authentification/controllers/on_boarding_controller.dart';
import 'package:authentech/utils/constants/colors.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/device/device_utility.dart';
import 'package:authentech/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSize.defautSpacing,
      bottom: TDveciceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: CircleBorder(), backgroundColor: dark? TColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
      );
  }
}


