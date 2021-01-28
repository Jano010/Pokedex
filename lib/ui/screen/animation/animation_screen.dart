import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screen/animation/components/animation_body.dart';

class AnimationScreen extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForthColor,
      body: AnimationBody(),
    );
  }
}
