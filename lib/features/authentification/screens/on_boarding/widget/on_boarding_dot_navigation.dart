
import 'package:authentech/features/authentification/controllers/on_boarding_controller.dart';
import 'package:authentech/utils/constants/colors.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/device/device_utility.dart';
import 'package:authentech/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDveciceUtils.getBottomNavigationBarHeight() + 25,
      left: TSize.defautSpacing,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark, dotHeight: 6),
      ),
    );
  }
}
