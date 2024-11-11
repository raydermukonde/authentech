import 'package:authentech/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // Utilisez lazyPut pour une instanciation paresseuse
    Get.lazyPut<NetworkManager>(() => NetworkManager());
  }
}
