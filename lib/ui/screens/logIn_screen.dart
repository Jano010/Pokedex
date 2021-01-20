import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/lists_screen.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/styles_constants.dart';
import 'package:pokedex/ui/widgets/main_elevatedButton.dart';
import 'package:pokedex/ui/widgets/background_scaffold.dart';
import 'package:pokedex/ui/dialogs/loading_dialog.dart';
import 'package:pokedex/ui/widgets/password_textField.dart';
import 'package:pokedex/ui/widgets/pokeball_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInScreen extends StatelessWidget {
  static const route = 'logIn_screen';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final bool newUser = ModalRoute.of(context).settings.arguments;

    String email = '';
    String password = '';

    return BackGroundScaffold(
      childWidget: Builder(
        builder: (BuildContext context) => Column(
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
                height: 32.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 80.0,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldsDecoration.copyWith(
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                  onChanged: (newValue) => email = newValue,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              PasswordTextField(
                onChangeText: (newValue) => password = newValue,
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                child: MainElevatedButton(
                  onPressed: () => newUser
                      ? registerUser(
                          userEmail: email,
                          userPassword: password,
                          buildContext: context)
                      : enterApp(
                          userEmail: email,
                          userPassword: password,
                          buildContext: context),
                  child: newUser ? Text('Register') : Text('Log In'),
                ),
              ),
            ]),
      ),
    );
  }

  void registerUser(
      {@required String userEmail,
      @required String userPassword,
      @required BuildContext buildContext}) async {
    try {
      LoadingDialog.showLoading(buildContext);
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      LoadingDialog.dissmissLoading(buildContext);
      if (userCredential != null) {
        Navigator.pushNamedAndRemoveUntil(
            buildContext, ListsScreen.route, (Route<dynamic> route) => false);
      }
    } on FirebaseAuthException catch (e) {
      LoadingDialog.dissmissLoading(buildContext);
      final SnackBar snackBar = SnackBar(
        content: Text(
          '${e.code}',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
      );
      Scaffold.of(buildContext).showSnackBar(snackBar);
    } catch (e) {
      print(e);
    }
  }

  void enterApp(
      {@required String userEmail,
      @required String userPassword,
      @required BuildContext buildContext}) async {
    try {
      LoadingDialog.showLoading(buildContext);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      LoadingDialog.dissmissLoading(buildContext);
      if (userCredential != null) {
        Navigator.pushNamedAndRemoveUntil(
            buildContext, ListsScreen.route, (Route<dynamic> route) => false);
      }
    } on FirebaseAuthException catch (e) {
      LoadingDialog.dissmissLoading(buildContext);
      print(e.code);
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'There is no user with that email';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong Password';
          break;
        default:
          errorMessage = 'There was a problema please try later';
      }
      final SnackBar snackBar = SnackBar(
        content: Text(
          '$errorMessage',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
      );
      Scaffold.of(buildContext).showSnackBar(snackBar);
    } catch (e) {
      print(e);
    }
  }
}
