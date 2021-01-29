import 'package:get/get.dart';
import 'package:pokedex/core/bindings/base_binding.dart';
import 'package:pokedex/core/controllers/listScreen_controller.dart';

class ListScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    Get.lazyPut<ListScreenController>(() => ListScreenController());
    super.dependencies();
  }
}
