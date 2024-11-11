
import 'package:authentech/common_widget/loaders/loaders.dart';
import 'package:authentech/features/authentification/models/user_model.dart';
import 'package:authentech/repository/authentiction_repository/authentication_repository.dart';
import 'package:authentech/repository/authentiction_repository/users_repository/user_repository.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/network_manager.dart';
import '../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Call this function from Design and it will do the rest
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', MtImages.waitingImage);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
            title: 'Connection Error',
            message: 'Please check your internet connection.');
        return;
      }
      TFullScreenLoader.stopLoading();

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TLoaders.errorSnackBar(
            title: 'Validation Error',
            message: 'Please fill all the fields correctly.');
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Privacy Policy',
            message: 'You must agree to the privacy policy.');
        return;
      }

      // Register user in Firebase
      final userCredential =
          await AuthenticationRepository.instance.createUserWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save Authenticated user data in Firebase
      final newUser = UserModel(
        id: userCredential.user!.uid,
        userName: userName.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        profilePicture: '',
        phoneNo: phoneNo.text,
      );

      userRepo.saveUserRecord(newUser);

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'You have successfully registered.');

      // Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      // Remove loading dialog
      TFullScreenLoader.stopLoading();
      // Show Error Message
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
