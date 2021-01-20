import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/background_scaffold.dart';
import 'package:pokedex/core/constants/styles_constants.dart';
import 'package:pokedex/ui/widgets/main_listView.dart';
import 'package:pokedex/ui/widgets/pokeball_logo.dart';
import 'package:pokedex/ui/screens/welcome_screen.dart';

class ListsScreen extends StatefulWidget {
  static const String route = 'list_screen';
  _ListsScreenState createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundScaffold(
      childWidget: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PokeballLogo(
                      height: 32.0,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      decoration:
                          InputDecoration(prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.logout),
                      tooltip: 'Log Out',
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushReplacementNamed(
                            context, WelcomeScreen.route);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              decoration: BoxDecoration(gradient: kMainColorgradient),
              height: 4.0,
              width: double.infinity,
            ),
            Expanded(child: MainList()),
            Container(
              decoration: BoxDecoration(gradient: kMainColorgradient),
              height: 4.0,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
