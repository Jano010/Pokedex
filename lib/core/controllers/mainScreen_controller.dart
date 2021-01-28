import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/ui/components/main_snackbar.dart';
import 'package:pokedex/ui/screen/welcome/welcome_screen.dart';

class MainScreenController extends GetxController {
  void logout() {
    FirebaseAuth.instance.signOut();
    navigator.pushReplacementNamed(WelcomeScreen.route);
  }

  void showUnderConstructionSnackbar() {
    MainSnackbar.show(title: kGenericErrorMsg.tr, msg: 'Under construction');
  }
}
