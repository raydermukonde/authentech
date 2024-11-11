
import 'package:authentech/features/authentification/controllers/on_boarding_controller.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/device/device_utility.dart';
import 'package:flutter/material.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDveciceUtils.getAppBarHeight(),
      right: TSize.defautSpacing,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Skip')
      ),
    
           );
  }
}


