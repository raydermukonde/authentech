import 'package:authentech/features/authentification/models/user_model.dart';
import 'package:authentech/repository/authentiction_repository/authentication_repository.dart';
import 'package:authentech/repository/authentiction_repository/users_repository/user_repository.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final AuthenticationRepository _authRepo = Get.put(AuthenticationRepository());
  final UserRepository _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.getCurrentUser()?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Erreur", "Connectez-vous pour continuer");
    }
  }

  Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();

  Future<void> updateRecord(UserModel user) async {
    await _userRepo.updateUser(user);
  }
}
