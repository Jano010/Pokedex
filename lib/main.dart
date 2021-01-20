import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screens/animation_screen.dart';
import 'package:pokedex/ui/screens/lists_screen.dart';
import 'package:pokedex/ui/screens/logIn_screen.dart';
import 'package:pokedex/ui/screens/pokemon_screen.dart';
import 'package:pokedex/ui/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // TODO: Do something when there was an error in firebase
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              initialRoute: AnimationScreen.route,
              routes: {
                AnimationScreen.route: (context) => AnimationScreen(),
                WelcomeScreen.route: (context) => WelcomeScreen(),
                LogInScreen.route: (context) => LogInScreen(),
                ListsScreen.route: (context) => ListsScreen(),
                PokemonScreen.route: (context) => PokemonScreen(),
              },
            );
          }

          return Center(
            child: Container(
              child: LoadingFlipping.circle(
                borderColor: kPrimaryColor,
              ),
            ),
          );
        });
  }
}
