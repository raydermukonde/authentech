import 'package:Broke_a_fintech_app/src/utils/constants/image_strings.dart';
import 'package:Broke_a_fintech_app/src/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Broke_a_fintech_app/src/features/authentification/models/user_model.dart';
import 'package:Broke_a_fintech_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Broke_a_fintech_app/src/repository/authentication_repository/user_repository/user_repository.dart';

import '../../../common_widgets/loaders/loaders.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../waiting_list/controllers/waiting_list_controller.dart';
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
  final listeAttenteController = Get.put(ListeAttenteController());
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Call this function from Design and it will do the rest
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information', TImages.waitingImage);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(title: 'Connection Error', message: 'Please check your internet connection.');
        return;
      };
      TFullScreenLoader.stopLoading();

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TLoaders.errorSnackBar(title: 'Validation Error', message: 'Please fill all the fields correctly.');
        return;
      };

      // Privacy Policy Check
      // Assuming you have a variable for privacy policy checkbox
       if (!privacyPolicy.value) {
         TLoaders.warningSnackBar(title: 'Privacy Policy', message: 'You must agree to the privacy policy.');
         return;
         
       };

      // Register user in Firebase
      final userCredential = await AuthenticationRepository.instance.createUserWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save Authenticated user data in the Firebase 
      final newUser = UserModel(
        id: userCredential.user!.uid,
        userName: userName.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        profilePicture: '', 
        phoneNo: phoneNo.text,
        );
        final userRepository = Get.put(UserRepository());
        userRepository.saveUserRecord(newUser);
        // show Success Message
        TLoaders.successSnackBar(title: 'Congratulations', message: 'You have successfully registered.');

        

      
        // Add user to waiting list
        listeAttenteController.ajouterUtilisateur();
        // remove loading dialog
        TFullScreenLoader.stopLoading();
        // show Success Message
        TLoaders.successSnackBar(title: 'Congratulations', message: 'You have successfully registered in the waiting list.');

        

        // Move to verify Email Screen
        Get.to(() => VerifyEmailScreen(email: email.text.trim()));
        
     
    } catch (e) {
       // remove loading dialog
      TFullScreenLoader.stopLoading();
      // Show Error Message
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
      
    }


}

  ///void registerUser(String email, String password) async {
    //if (error != null) {
      //Get.showSnackbar(GetSnackBar(message: error.toString()));
    ///} else {
      // User creation successful, add to waiting list
      //await createUser(UserModel(
        //  email: email,
          //fullName: fullName.text,
          //phoneNo: phoneNo.text,
          //password: ''));
    //}
  //}

  //Get phoneNo from user and pass it to Auth

  ///Future<void> createUser(UserModel user) async {
    ///await userRepo.createUser(user);
    ///authWithPhoneNumber(user.phoneNo);
    //Get.to(() => const OtpScreen());

    // Add user to waiting list
    //listeAttenteController.ajouterUtilisateur();
  

  //void authWithPhoneNumber(String phoneNo) {
    //AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  //}

