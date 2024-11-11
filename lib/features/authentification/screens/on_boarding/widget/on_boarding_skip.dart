
import 'package:flutter/material.dart';
import 'package:myapp/features/authentification/controllers/on_boarding_controller.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/device/device_utility.dart';

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


