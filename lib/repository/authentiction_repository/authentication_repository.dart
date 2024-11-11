
import 'package:authentech/features/authentification/screens/login/login_screen.dart';
import 'package:authentech/features/authentification/screens/on_boarding/on_boarding_screen.dart';
import 'package:authentech/features/authentification/screens/signup/verify_email.dart';
import 'package:authentech/navigation_menu.dart';
import 'package:authentech/repository/authentiction_repository/exceptions/firebase_auth_exceptions.dart';
import 'package:authentech/repository/authentiction_repository/exceptions/signup_email_password_failure.dart';
import 'package:authentech/repository/authentiction_repository/users_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'exceptions/login_email_password_faillure.dart';


class AuthenticationRepository extends GetxController {
  // Instance singleton
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get authenticated User Data
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove(); // Supprimer l'écran de démarrage
    screenRedirect(); // Rediriger vers l'écran approprié
  }

  // Redirection vers l'écran approprié en fonction de la valeur stockée localement
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  // Connexion avec Google
  Future<Object> signInWithGoogle() async {
    try {
      // Déclencher le flux d'authentification
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtenir les détails d'authentification de la requête
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Créer un nouveau credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      // Vérifier si l'utilisateur est déjà connecté à Firebase
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Lier le compte Google au compte Firebase existant
        await currentUser.linkWithCredential(credentials);
        // Récupérer l'utilisateur actuel après la liaison des credentials
        return FirebaseAuth.instance.currentUser!;
      } else {
        // Créer un nouveau compte Firebase avec le credential Google
        return await FirebaseAuth.instance.signInWithCredential(credentials);
      }
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailPasswordFailure.fromCode(e.code);
      print('EXCEPTION FIREBASE AUTH: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = LoginWithEmailPasswordFailure.defaultError();
      print('EXCEPTION: ${ex.message}');
      throw 'Erreur lors de la connexion';
    }
  }

  // Création d'utilisateur avec email et mot de passe
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.fromCode(e.code);
      print('EXCEPTION FIREBASE AUTH: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailPasswordFailure();
      print('EXCEPTION: ${ex.message}');
      throw 'Erreur lors de la création du compte';
    }
  }

  // Envoi de la vérification par email
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.fromCode(e.code);
      print('EXCEPTION FIREBASE AUTH: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailPasswordFailure();
      print('EXCEPTION: ${ex.message}');
      throw 'Erreur lors de l\'envoi de la vérification par email';
    }
  }

  // Mot de passe oublié
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.fromCode(e.code);
      print('EXCEPTION FIREBASE AUTH: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailPasswordFailure();
      print('EXCEPTION: ${ex.message}');
      throw 'Erreur lors de l\'envoi du lien de réinitialisation de mot de passe';
    }
  }

  // -- RE Authentication
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      // Re-authenticate the user
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.fromCode(e.code);
      print('EXCEPTION FIREBASE AUTH: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailPasswordFailure();
      print('EXCEPTION: ${ex.message}');
      throw 'Erreur lors de l\'envoi de la vérification par email';
    }
    }
  

  // Connexion avec email et mot de passe
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailPasswordFailure.fromCode(e.code);
      print('EXCEPTION FIREBASE AUTH: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = LoginWithEmailPasswordFailure.defaultError();
      print('EXCEPTION: ${ex.message}');
      throw 'Erreur lors de la connexion';
    }
  }

  // Déconnexion
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailPasswordFailure.fromCode(e.code);
      print('EXCEPTION FIREBASE AUTH: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = LoginWithEmailPasswordFailure.defaultError();
      print('EXCEPTION: ${ex.message}');
      throw ex;
    }
  }

  // Méthode pour obtenir l'utilisateur actuel
  User? getCurrentUser() {
    return _auth.currentUser;
  }
  // Delete user
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserDetails(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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

