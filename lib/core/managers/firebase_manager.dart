import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/ui/components/loading_animation.dart';
import 'package:pokedex/ui/components/main_snackbar.dart';
import 'package:pokedex/ui/screen/favourite_pkmn/favouritePkmn_screen.dart';
import 'package:pokedex/ui/screen/welcome/welcome_screen.dart';

class FirebaseManager extends GetxController {
/*============================================================================*/
/*  Singleton Creation  */
/*============================================================================*/

  static final FirebaseManager _instance = FirebaseManager._internal();

  factory FirebaseManager() {
    return _instance;
  }

  FirebaseManager._internal() {
    debugPrint('FirebaseManager initiated');
  }

  static FirebaseManager get instance => Get.find();

/*============================================================================*/
/*  FireBase Authentication */
/*============================================================================*/

  static User get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> autheticateUser(
      {@required bool newUserCallback,
      @required String userEmailCallback,
      @required String userPasswordCallback}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential _user;
    LoadingAnimation.show();
    try {
      if (newUserCallback) {
        _user = await _auth.createUserWithEmailAndPassword(
            email: userEmailCallback, password: userPasswordCallback);
        createFireStorefavPkmnDocument();
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
      Get.offNamedUntil(FavouritePkmnScreen.route, (route) => false);
    }
  }

  Future<void> signOut() async {
    LoadingAnimation.show();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    LoadingAnimation.dismiss();
    Get.offAllNamed(WelcomeScreen.route);
  }

/*============================================================================*/
/*  FireBase CloudStorage */
/*============================================================================*/

  final String _favPkmnCollection = 'FavPkmn';
  final String _favPkmnDocField = 'favPkmn';

  String get favPkmnDocField => _favPkmnDocField;

  Future<void> createFireStorefavPkmnDocument() {
    CollectionReference _favPkmn =
        FirebaseFirestore.instance.collection(_favPkmnCollection);

    return _favPkmn
        .doc(FirebaseManager.currentUser.email)
        .set({_favPkmnDocField: []})
        .then((value) => debugPrint('User FavPkmn Document created'))
        .catchError((error) => debugPrint('Failed to create document: $error'));
  }

  Future<DocumentSnapshot> retriveFavPkmnDocument() {
    CollectionReference _favPkmn =
        FirebaseFirestore.instance.collection(_favPkmnCollection);
    return _favPkmn.doc(FirebaseManager.currentUser.email).get();
  }

  Future<void> updateFavPkmn({@required List<String> favPkmn}) {
    CollectionReference _favPkmn =
        FirebaseFirestore.instance.collection(_favPkmnCollection);

    return _favPkmn
        .doc(FirebaseManager.currentUser.email)
        .update({_favPkmnDocField: favPkmn})
        .then((value) => null)
        .catchError((error) => null);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
