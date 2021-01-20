import 'package:flutter/material.dart';
import 'colors_constants.dart';

const InputDecoration kTextFieldsDecoration = InputDecoration(
  hintText: 'Enter your Email',
  hintStyle: TextStyle(
    color: kSecondaryTextColor,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kThirdColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kForthColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const LinearGradient kBackgroundColorGradient = LinearGradient(colors: [
  kFirstBackgroundColor,
  kSecondBackgroundColor,
  kThirdBackgroundColor,
  kForthBackgroundColor,
]);

const LinearGradient kMainColorgradient = LinearGradient(colors: [
  kPrimaryColor,
  kSecondaryColor,
  kThirdColor,
  kForthColor,
]);
