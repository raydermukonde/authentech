import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Broke_a_fintech_app/src/features/authentification/screens/welcome/welcome_screen.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Junp to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index and jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();


      if (kDebugMode) {
      print('============= GetStorage next button ============');
      print(storage.read('IsFirstTime'));
    }
    
      storage.write('IsFirstTime', false);
      Get.offAll(const WelcomeScreen());
    } else {
      currentPageIndex.value++;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  /// Update Current Index and jump to last page
  void skipPage() {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3978491060.
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
