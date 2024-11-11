
import 'package:authentech/common_widget/loaders/loaders.dart';
import 'package:authentech/features/authentification/models/user_model.dart';
import 'package:authentech/repository/authentiction_repository/authentication_repository.dart';
import 'package:authentech/repository/authentiction_repository/users_repository/user_repository.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../../../utils/helpers/network_manager.dart';
import '../screens/login/login_screen.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();


  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

@override
  void onInit() {
   
    super.onInit();
    fetchUserRecord();
  }


  /// Fetch user record from the database
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }


  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update Rx User and then check if user data is already saved
      await fetchUserRecord();

      // if not record already stored.
      if (user.value.id.isEmpty) {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Create User Object
        final user = UserModel(
          id: userCredentials.user!.uid,
          email: userCredentials.user!.email ?? '',
          userName: username,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          phoneNo: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user record to the database or perform further operations
        // Example:
         await userRepository.saveUserRecord(user);
      }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }
  /// Delete Account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSize.md),
      title: 'Delete Account',
      middleText: 
      'Are you sure you want to delete your account? This action is not reversible and all of your data will be permanently deleted.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)
        ),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSize.lg), child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        child: const  Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
      
     
    );
  }
  /// Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', MtImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) { 
      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        TFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
           } else if (provider == 'password') {
            TFullScreenLoader.stopLoading();
            Get.to(() => const LoginScreen());
           }
      }
  
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }

  }
  /// -- RE-Authenticate User
Future<void> reAuthenticateEmailAndPasswordUser() async {
  try {
    TFullScreenLoader.openLoadingDialog('Processing', MtImages.docerAnimation);

    // Check internet
    final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(title: 'Connection Error', message: 'Please check your internet connection.');
        return;
      };

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());

  }
  
}
/// Upload Profile Picture
uploadUserProfilePicture() async {
  try {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
  if (image != null) {
    imageUploading.value = true;
    // Upload image to Firebase Storage
    final imageUrl = await userRepository.uploadImage('Users/Images/Profile', image);
    // Update user profile picture
    Map<String, dynamic> json = {
      'ProfilePicture': imageUrl,
    };
    await userRepository.updateSingleField(json);
    user.value.profilePicture = imageUrl;
    user.refresh();
    TLoaders.successSnackBar(title: 'Success', message: 'Profile picture updated successfully.');
  } 
} catch (e) {
  TLoaders.errorSnackBar(title: 'Error', message: 'Failed to upload profile picture. $e');
} finally {
  imageUploading.value = false;
}
  }
}
  



