import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screen/main/components/mainScreen_body.dart';

class MainScreen extends StatelessWidget {
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForthColor,
      body: MainBody(),
    );
  }
}
