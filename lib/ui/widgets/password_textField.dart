import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/styles_constants.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({@required this.onChangeText});

  final Function onChangeText;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80.0),
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: _hidePassword,
        onChanged: (newValue) => widget.onChangeText(newValue),
        decoration: kTextFieldsDecoration.copyWith(
          hintText: 'Enter your Password',
          suffixIcon: GestureDetector(
            child:
                Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
          ),
        ),
      ),
    );
  }
}
