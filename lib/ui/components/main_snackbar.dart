import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/constants/colors_constants.dart';

class MainSnackbar {
  static void show({@required String title, @required String msg}) {
    Get.snackbar(title, msg,
        backgroundColor: kAccentColor,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        colorText: kMainColor);
  }
}
