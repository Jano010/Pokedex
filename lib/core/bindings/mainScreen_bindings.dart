import 'package:get/get.dart';
import 'package:pokedex/core/bindings/base_binding.dart';
import 'package:pokedex/core/controllers/mainScreen_controller.dart';

class MainScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController());
    super.dependencies();
  }
}
