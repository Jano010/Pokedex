import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/styles_constants.dart';

class BackGroundScaffold extends StatelessWidget {
  BackGroundScaffold(
      {@required this.childWidget, this.appBarWidget, this.bottomNavWidget});

  final Widget childWidget;
  final Widget appBarWidget;
  final Widget bottomNavWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget,
      bottomNavigationBar: bottomNavWidget,
      body: Container(
        decoration: BoxDecoration(gradient: kBackgroundColorGradient),
        child: childWidget,
      ),
    );
  }
}
