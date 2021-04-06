// TextField Decoration
import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';

// Decoration for text inputs like password and email
const kTextFieldDecoration = InputDecoration(
  hintText: "Label text",
  filled: true,
  fillColor: kMainColor,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTitleStyle =
    TextStyle(color: kMainColor, fontSize: 32.0, fontFamily: kCircularStdFont);

const kParagraphStyle =
    TextStyle(color: kMainColor, fontSize: 16.0, fontFamily: kCircularStdFont);

const kSubTextStyle =
    TextStyle(color: kMainColor, fontSize: 12.0, fontFamily: kCircularStdFont);
