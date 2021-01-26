import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    @required this.text,
    @required this.onPressedCallback,
    Key key,
  }) : super(key: key);

  final String text;
  final Function onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: kAccentColor,
        elevation: 8.0,
        textStyle: TextStyle(
          color: kMainColor,
          fontSize: 16.0,
        ),
      ),
      onPressed: onPressedCallback,
    );
  }
}
