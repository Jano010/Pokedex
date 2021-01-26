import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pokedex/core/constants/colors_constants.dart';

class LoadingAnimation {
  static void show() {
    Get.dialog(
        Center(
          child: LoadingFlipping.circle(
            borderColor: kMainColor,
            borderSize: 10.0,
            size: 60.0,
          ),
        ),
        barrierDismissible: false);
  }

  static void dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen) {
      navigator.pop();
    }
  }
}
