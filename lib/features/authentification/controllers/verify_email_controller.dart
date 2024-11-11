
import 'dart:async';


import 'package:authentech/common_widget/loaders/loaders.dart';
import 'package:authentech/common_widget/success_screen/success_screen.dart';
import 'package:authentech/repository/authentiction_repository/authentication_repository.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Send Email Whenever verify Screen appears and set timer for auto redirect
  @override
  void onInit() {
    
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email verification Link
  sendEmailVerification() async {
    try {
     await AuthenticationRepository.instance.sendEmailVerification();
     TLoaders.successSnackBar(title: 'Success', message: 'Email verification link sent successfully.');

    } catch(e){
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
  
  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async{
  await FirebaseAuth.instance.currentUser!.reload();
  final user = FirebaseAuth.instance.currentUser;
  if (user?.emailVerified ?? false) {
    timer.cancel();
    Get.off(() => SuccessScreen(
      image: MtImages.successfullyRegistration, 
      title: MtTexts.yourAccountCreatedTitle, 
      subtitle: MtTexts.yourAccountCreatedSubTitle, 
      onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
  }

    });
  }
  ///  Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
      image: MtImages.successfullyRegistration, 
      title: MtTexts.yourAccountCreatedTitle, 
      subtitle: MtTexts.yourAccountCreatedSubTitle, 
      onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}
