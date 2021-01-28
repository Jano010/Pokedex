import 'package:get/get.dart';
import 'package:pokedex/core/bindings/base_binding.dart';
import 'package:pokedex/core/controllers/authenticationScreen_controller.dart';

class AuthenticationScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AuthenticationScreenController>(
        () => AuthenticationScreenController());
  }
}
