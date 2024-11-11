

import 'dart:io';

import 'package:authentech/features/authentification/models/user_model.dart';
import 'package:authentech/repository/authentiction_repository/authentication_repository.dart';
import 'package:authentech/repository/authentiction_repository/exceptions/firebase_auth_exceptions.dart';
import 'package:authentech/repository/authentiction_repository/exceptions/login_email_password_faillure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../exceptions/signup_email_password_failure.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar("Success", "You account has been created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    // ignore: body_might_complete_normally_catch_error
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      if (kDebugMode) {
        print("Error $error");
      }
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUser(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  Future<void> saveUserRecord(UserModel user) async {
    try { 
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.fromCode(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION: ${ex.message}');
      }
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailPasswordFailure();
      if (kDebugMode) {
        print('EXCEPTION: ${ex.message}');
      }
      throw ex;
    }
  }
  // Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      
      
    } else {
      return UserModel.empty();
    }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw  SignUpWithEmailPasswordFailure();
    } on PlatformException catch (e) {
      throw LoginWithEmailPasswordFailure(e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  // Function to update user details
Future<void> updateUserDetails(UserModel updatedUser) async {
  try {
    await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
  } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw  SignUpWithEmailPasswordFailure();
    } on PlatformException catch (e) {
      throw LoginWithEmailPasswordFailure(e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
}
// Update any field in specific Users Collection
Future<void> updateSingleField(Map<String, dynamic> json) async {
  try {
    await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
  } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw  SignUpWithEmailPasswordFailure();
    } on PlatformException catch (e) {
      throw LoginWithEmailPasswordFailure(e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
}
// Function to delete user details
Future<void> removeUserDetails(String userId) async {
  try {
    await _db.collection("Users").doc(userId).delete();
  } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw  SignUpWithEmailPasswordFailure();
    } on PlatformException catch (e) {
      throw LoginWithEmailPasswordFailure(e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
}
// Upload any image to Firebase Storage
Future<String> uploadImage(String path, XFile image) async {
  try {
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;

  } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw  SignUpWithEmailPasswordFailure();
    } on PlatformException catch (e) {
      throw LoginWithEmailPasswordFailure(e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
}

}
