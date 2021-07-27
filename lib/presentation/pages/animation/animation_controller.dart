import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex/presentation/navigation/app_routes.dart';

class AnimationPageController extends GetxController
    with SingleGetTickerProviderMixin {
  // Animation objects
  late AnimationController _animationController;
  late Animation<double> _animation;
  Animation<double> get animation => _animation;

  // Animation properties
  final int _animationDurationInSeconds = 3;

  @override
  void onInit() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: _animationDurationInSeconds));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _animation.addStatusListener((animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        Get.offNamed(AppRoutes.kHomePage);
      }
    });
    _animationController.forward();
    super.onInit();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
