import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex/presentation/pages/animation/animation_controller.dart';

class AnimationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimationPageController());
  }
}
