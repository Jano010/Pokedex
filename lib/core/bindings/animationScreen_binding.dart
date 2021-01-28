import 'package:get/get.dart';
import 'package:pokedex/core/bindings/base_binding.dart';
import 'package:pokedex/core/controllers/animationScreen_controller.dart';

class AnimationScreenbinding extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AnimationScreenController>(() => AnimationScreenController());
  }
}
