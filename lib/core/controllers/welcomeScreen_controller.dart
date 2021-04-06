import 'package:get/get.dart';
import 'package:pokedex/ui/screen/authentication/authentication_screen.dart';

class WelcomeScreenController extends GetxController {
  static WelcomeScreenController get instance => Get.find();

  void goToLogInScreen() {
    Get.toNamed(AuthenticationScreen.route, arguments: false);
  }

  void goToSignInScreen() {
    Get.toNamed(AuthenticationScreen.route, arguments: true);
  }
}
