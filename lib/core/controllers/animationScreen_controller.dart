import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/ui/screen/main/main_screen.dart';
import 'package:pokedex/ui/screen/welcome/welcome_screen.dart';

class AnimationScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  Animation get animation => _animation;

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    );

    _animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        User _user = FirebaseAuth.instance.currentUser;
        _user == null
            ? navigator.pushReplacementNamed(WelcomeScreen.route)
            : navigator.pushReplacementNamed(MainScreen.route);
      }
    });

    _animationController.forward();

    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
