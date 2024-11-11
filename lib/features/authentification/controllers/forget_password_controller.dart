import 'package:Broke_a_fintech_app/src/common_widgets/loaders/loaders.dart';
import 'package:Broke_a_fintech_app/src/features/authentification/screens/password_configuration/reset_password.dart';
import 'package:Broke_a_fintech_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Broke_a_fintech_app/src/utils/constants/image_strings.dart';
import 'package:Broke_a_fintech_app/src/utils/helpers/network_manager.dart';
import 'package:Broke_a_fintech_app/src/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// variables
final email = TextEditingController();
GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// functions
  ///  Send reset password email
  sendPasswordResetEmail() async {
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);
      // Check Internet Connection
      final isConnected = await NetworkManager().isConnected();
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1327351868.
      if (!isConnected) {TFullScreenLoader.stopLoading(); return;
}
// Check if form is valid
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Password reset email sent successfully.'.tr);

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show Error Screen
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
  resendPasswordEmail(String email) async {
    try{
       // start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);
      // Check Internet Connection
      final isConnected = await NetworkManager().isConnected();
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1327351868.
      if (!isConnected) {TFullScreenLoader.stopLoading(); return;
}
// Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Password reset email sent successfully.'.tr);

      
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show Error Screen
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}

