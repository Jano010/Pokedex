import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/ui/components/loading_animation.dart';
import 'package:get/get.dart';
import 'package:pokedex/ui/components/main_snackbar.dart';
import 'package:pokedex/ui/screen/main/main_screen.dart';

class AuthenticationScreenController extends GetxController {
  Future<void> autheticateUser(
      {@required bool newUserCallback,
      @required String userEmailCallback,
      @required String userPasswordCallback}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential _user;
    LoadingAnimation.show();
    try {
      if (newUserCallback) {
        _user = await _auth.createUserWithEmailAndPassword(
            email: userEmailCallback, password: userPasswordCallback);
      } else {
        _user = await _auth.signInWithEmailAndPassword(
            email: userEmailCallback, password: userPasswordCallback);
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      String errorMsg;
      switch (e.code) {
        case 'weak-password':
          errorMsg = kWeakPasswordMsg.tr;
          break;
        case 'email-already-in-use':
          errorMsg = kEmailUsedMsg.tr;
          break;
        case 'user-not-found':
          errorMsg = kUserNotFoundMsg.tr;
          break;
        case 'wrong-password':
          errorMsg = kWrongPasswordMsg.tr;
          break;
        default:
          errorMsg = kGenericErrorMsg.tr;
          break;
      }
      _user = null;

      LoadingAnimation.dismiss();
      MainSnackbar.show(title: kGenericErrorMsg.tr, msg: errorMsg);
    } catch (e) {
      _user = null;
      LoadingAnimation.dismiss();
      MainSnackbar.show(title: kGenericErrorMsg.tr, msg: kGenericErrorMsg.tr);
      debugPrint(e);
    }

    if (_user != null) {
      navigator.pushNamedAndRemoveUntil(
          MainScreen.route, (Route<dynamic> route) => false);
    }
  }
}
