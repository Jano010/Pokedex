import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/logIn_screen.dart';
import 'package:pokedex/ui/widgets/background_scaffold.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/widgets/main_elevatedButton.dart';
import 'package:pokedex/ui/widgets/pokeball_logo.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  static const String route = 'welcome_screen';
  bool newUser;

  @override
  Widget build(BuildContext context) {
    return BackGroundScaffold(
        childWidget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokeballLogo(
          height: 88.0,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          'Pokedex',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.0,
            color: kMainTextColor,
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: MainElevatedButton(
            onPressed: () {
              newUser = false;
              Navigator.pushNamed(context, LogInScreen.route,
                  arguments: newUser);
            },
            child: Text('Log In'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: MainElevatedButton(
            onPressed: () {
              newUser = true;
              Navigator.pushNamed(context, LogInScreen.route,
                  arguments: newUser);
            },
            child: Text('Register'),
          ),
        )
      ],
    ));
  }
}
