import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';

class MainElevatedButton extends StatelessWidget {
  MainElevatedButton({@required this.child, @required this.onPressed});

  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      color: kPrimaryColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      onPressed: onPressed,
    );
  }
}
