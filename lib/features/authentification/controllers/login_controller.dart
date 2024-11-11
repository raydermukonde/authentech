
import 'package:authentech/common_widget/loaders/loaders.dart';
import 'package:authentech/repository/authentiction_repository/authentication_repository.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/helpers/network_manager.dart';
import 'package:authentech/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import 'user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Email and Password SignIn
  Future<void> loginUser() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging in...', MtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email and password Authentication

      // Stop Loading
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Stop Loading
      TFullScreenLoader.stopLoading();

      // Show error message
      Get.snackbar('Error', e.toString());
    }
  }

  /// -- Google SignIn
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging in...', MtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials as UserCredential?);

      // Stop Loading
      TFullScreenLoader.stopLoading();
      
      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Stop Loading
      TFullScreenLoader.stopLoading();

      // Show error message
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
