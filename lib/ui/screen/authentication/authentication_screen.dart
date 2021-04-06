import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screen/authentication/components/auth_body.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  static const String route = '/authentication';
  final bool newUserCallback = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForthColor,
      body: AuthenticationBody(
        newUser: newUserCallback == null ? false : newUserCallback,
      ),
    );
  }
}
