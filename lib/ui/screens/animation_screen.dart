import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/lists_screen.dart';
import 'package:pokedex/ui/screens/welcome_screen.dart';
import 'package:pokedex/ui/widgets/background_scaffold.dart';
import 'package:pokedex/ui/widgets/pokeball_logo.dart';

class AnimationScreen extends StatefulWidget {
  static const String route = 'animation_screen';

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool alreadyLogInUser = false;
  AnimationController _controller;
  Animation _animation;

/*----------------------------------------------------------------------------*/
/*   Lifecycle and UI   */
/*----------------------------------------------------------------------------*/

  @override
  void initState() {
    initiAndControlAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundScaffold(
      childWidget: Center(
        child: RotationTransition(
          turns: _animation,
          child: PokeballLogo(
            height: 88.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

/*----------------------------------------------------------------------------*/
/*   Logic   */
/*----------------------------------------------------------------------------*/

  void initiAndControlAnimation() async {
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );

    _controller.forward();

    alreadyLogInUser = _auth.currentUser != null;

    _animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context,
            alreadyLogInUser ? ListsScreen.route : WelcomeScreen.route);
      }
    });
  }
}
