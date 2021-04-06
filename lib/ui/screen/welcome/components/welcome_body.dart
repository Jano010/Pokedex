import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/core/controllers/welcomeScreen_controller.dart';
import 'package:pokedex/ui/screen/welcome/components/welcome_button.dart';
import 'package:get/get.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WelcomeScreenController _controller =
        WelcomeScreenController.instance;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'logo',
            child: Column(
              children: [
                SvgPicture.asset(kMainLogo, color: kMainColor, height: 100.0),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  kPokedexString.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 40.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          WelcomeButton(
            text: kLoginString.tr,
            onPressedCallback: () {
              _controller.goToLogInScreen();
            },
          ),
          SizedBox(height: 8.0),
          WelcomeButton(
            text: kRegisterString.tr,
            onPressedCallback: () {
              _controller.goToSignInScreen();
            },
          ),
        ],
      ),
    );
  }
}
