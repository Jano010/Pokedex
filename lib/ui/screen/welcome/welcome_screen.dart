import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screen/welcome/components/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = '/welcomen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForthColor,
      body: SafeArea(
        child: WelcomeBody(),
      ),
    );
  }
}
