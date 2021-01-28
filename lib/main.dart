import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/core/bindings/animationScreen_binding.dart';
import 'package:pokedex/core/bindings/authenticationScreen_binding.dart';
import 'package:pokedex/core/bindings/mainScreen_bindings.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/ui/screen/animation/animation_screen.dart';
import 'package:pokedex/ui/screen/authentication/authentication_screen.dart';
import 'package:pokedex/ui/screen/main/main_screen.dart';
import 'package:pokedex/ui/screen/welcome/welcome_screen.dart';
import 'package:pokedex/core/utils/messages.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        // Showing a snackbar on an error
        if (snapshot.hasError) {
          Get.snackbar(kErrorMsg.tr, kGenericErrorMsg.tr);
          return Scaffold(
            backgroundColor: kForthColor,
          );
        }

        // When finished if succesfull, then open app
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            // Internasionalization
            translations: Messages(),
            locale: Locale('en', 'US'),
            fallbackLocale: Locale('en', 'US'),
            // Navigation
            initialRoute: AnimationScreen.route,
            getPages: [
              GetPage(
                  name: AnimationScreen.route,
                  page: () => AnimationScreen(),
                  binding: AnimationScreenbinding()),
              GetPage(name: WelcomeScreen.route, page: () => WelcomeScreen()),
              GetPage(
                  name: AuthenticationScreen.route,
                  page: () => AuthenticationScreen(),
                  binding: AuthenticationScreenBindings(),
                  transition: Transition.rightToLeftWithFade),
              GetPage(
                  name: MainScreen.route,
                  page: () => MainScreen(),
                  binding: MainScreenBindings(),
                  transition: Transition.rightToLeftWithFade),
            ],
          );
        }

        // Loading Screen
        return Scaffold(
          backgroundColor: kForthColor,
        );
      },
    );
  }
}
