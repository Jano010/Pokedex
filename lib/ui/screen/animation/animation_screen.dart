import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/animationScreen_controller.dart';
import 'package:pokedex/ui/screen/animation/components/animation_body.dart';
import 'package:get/get.dart';

class AnimationScreen extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    AnimationScreenController _controller =
        Get.put(AnimationScreenController());

    return Scaffold(
      backgroundColor: kForthColor,
      body: AnimationBody(),
    );
  }
}
