import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/styles_constants.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/core/controllers/authenticationScreen_controller.dart';
import 'package:pokedex/ui/screen/welcome/components/welcome_button.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AuthenticationBody extends StatelessWidget {
  AuthenticationBody({@required this.newUser});

  final AuthenticationScreenController _controller = Get.find();
  final bool newUser;

  String userEmail = '';
  String userPassword = '';

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
          TextField(
            decoration:
                kTextFieldDecoration.copyWith(hintText: kEnterEmailMsg.tr),
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (newValue) {
              userEmail = newValue;
            },
          ),
          SizedBox(height: 8.0),
          TextField(
            obscureText: true,
            decoration: kTextFieldDecoration.copyWith(
              hintText: kEnterPasswordMsg.tr,
            ),
            textAlign: TextAlign.center,
            onChanged: (newValue) {
              userPassword = newValue;
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          WelcomeButton(
            text: newUser ? kRegisterString.tr : kLoginString.tr,
            onPressedCallback: () => _controller.autheticateUser(
                newUserCallback: newUser,
                userEmailCallback: userEmail,
                userPasswordCallback: userPassword),
          ),
        ],
      ),
    );
  }
}
