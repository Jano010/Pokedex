import 'package:get/get.dart';
import 'package:pokedex/core/services/network_manager.dart';

abstract class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkManager>(() => NetworkManager());
  }
}
