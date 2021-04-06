import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/managers/firebase_manager.dart';

class AuthenticationScreenController extends GetxController {
  static AuthenticationScreenController get instance => Get.find();

  final FirebaseManager _fbManager = FirebaseManager.instance;

  void authenticateUser(bool newUser, String userEmail, String userPassword) {
    if (_fbManager == null) {
      debugPrint('Es Nulo');
    } else {
      _fbManager.autheticateUser(
          newUserCallback: newUser,
          userEmailCallback: userEmail,
          userPasswordCallback: userPassword);
    }
  }
}
