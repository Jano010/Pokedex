import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pokedex/core/constants/colors_constants.dart';

class LoadingDialog {
  static Future<void> showLoading(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Center(
            child: LoadingFlipping.circle(
              borderColor: kPrimaryColor,
              borderSize: 10.0,
              size: 60.0,
            ),
          ),
        );
      },
    );
  }

  static dissmissLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
