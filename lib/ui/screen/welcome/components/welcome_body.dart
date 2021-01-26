import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/ui/screen/authentication/authentication_screen.dart';
import 'package:pokedex/ui/screen/welcome/components/welcome_button.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                WebsafeSvg.asset(kMainLogo, color: kMainColor, height: 100.0),
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
              navigator.pushNamed(AuthenticationScreen.route, arguments: false);
            },
          ),
          SizedBox(height: 8.0),
          WelcomeButton(
            text: kRegisterString.tr,
            onPressedCallback: () {
              navigator.pushNamed(AuthenticationScreen.route, arguments: true);
            },
          ),
        ],
      ),
    );
  }
}
