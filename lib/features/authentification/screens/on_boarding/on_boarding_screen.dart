
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/authentification/controllers/on_boarding_controller.dart';
import 'package:myapp/features/authentification/screens/on_boarding/widget/on_boarding_next_button.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/text_strings.dart';

import 'widget/on_boarding_dot_navigation.dart';
import 'widget/on_boarding_page.dart';
import 'widget/on_boarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
      children: [
        /// Horizontal Scrollable Pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBordingPages(
              image: MtImages.mtOnBoardingImage1,
              title: MtTexts.mtOnBoardingTitle1,
              subTitle: MtTexts.mtOnBoardingSubTitle1,
            ),
            OnBordingPages(
              image: MtImages.mtOnBoardingImage2,
              title: MtTexts.mtOnBoardingTitle2,
              subTitle: MtTexts.mtOnBoardingSubTitle2,
            ),
            OnBordingPages(
              image: MtImages.mtOnBoardingImage3,
              title: MtTexts.mtOnBoardingTitle3,
              subTitle: MtTexts.mtOnBoardingSubTitle3,
            ),
          ],
        ),

        /// Skip Button
        const OnBoardingSkip(),

        /// Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        /// Next Button
        const OnBoardingNextButton(),
      ],
    ));
  }
}
