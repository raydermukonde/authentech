
import 'package:authentech/common_widget/loaders/loaders.dart';
import 'package:authentech/features/authentification/controllers/user_controller.dart';
import 'package:authentech/features/core/screens/home.dart';
import 'package:authentech/repository/authentiction_repository/users_repository/user_repository.dart';
import 'package:authentech/utils/constants/image_strings.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();


  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen is opened
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeName() async {
    
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }
  /// Update user name
Future<void> updateUserName() async {
  try {
     //Start Loading
    TFullScreenLoader.openLoadingDialog(
        'We are updating your information', MtImages.waitingImage);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
  }
  // Form Validation
  if (!updateUserNameFormKey.currentState!.validate()) {
    TFullScreenLoader.stopLoading();
    return;
  }

  // Update User Name
  Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
  await userRepository.updateSingleField(name);

  // Update the Rx User 
  userController.user.value.firstName = firstName.text.trim();
  userController.user.value.lastName = lastName.text.trim();

  // Remove Loader
  TFullScreenLoader.stopLoading();

  // Show Success Message
  TLoaders.successSnackBar(
    title: 'Success',
    message: 'Your name has been updated successfully',
  );

  // Move to previous screen

  Get.off(() => HomePage());
} catch (e) {
  TFullScreenLoader.stopLoading();
  TLoaders.errorSnackBar(
    title: 'Data not saved',
    message: 'Something went wrong while saving your information. You can re-save your data in your profile.',
  );



  }
}
}


