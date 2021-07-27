import 'package:flutter/material.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';

class AppInputDecoration {
  static final kSearchInputDecoration = InputDecoration(
    prefixIcon: Icon(
      Icons.search,
      color: Colors.grey,
    ),
    hintText: "Search Pokemon",
    hintStyle: AppTextThemes.kHintTextStyle,
    contentPadding: EdgeInsets.all(16.0),
    filled: true,
    fillColor: AppColors.kWhiteAccentColor,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24.0))),
  );
}
