import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/animationScreen_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class AnimationBody extends StatefulWidget {
  @override
  _AnimationBodyState createState() => _AnimationBodyState();
}

class _AnimationBodyState extends State<AnimationBody> {
  AnimationScreenController _controller;

  /*==========================================================================*/
  /* LifeCycle and UI */
  /*==========================================================================*/
  @override
  void initState() {
    _controller = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller.animation,
        child: Hero(
          tag: "logo",
          child: WebsafeSvg.asset(kMainLogo, color: kMainColor, height: 180.0),
        ),
      ),
    );
  }
}
