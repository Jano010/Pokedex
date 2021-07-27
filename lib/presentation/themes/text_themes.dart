import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';

class AppTextThemes {
  static const _hintSize = 12.0;
  static const _buttonSize = 14.0;
  static const _bodySize = 16.0;
  static const _subtitleSize = 24.0;
  static const _titleSize = 34.0;

  static final TextStyle kHintTextStyle = GoogleFonts.ubuntu(
      textStyle: TextStyle(color: Colors.grey, fontSize: _hintSize));

  static final TextStyle kButtonTextStyle = GoogleFonts.ubuntu(
      textStyle:
          TextStyle(color: AppColors.kWhiteAccentColor, fontSize: _buttonSize));

  static final kBodyTextStyle = GoogleFonts.ubuntu(
      textStyle:
          TextStyle(color: AppColors.kWhiteAccentColor, fontSize: _bodySize));

  static final kSubtitleTextStyle = GoogleFonts.ubuntu(
      textStyle: TextStyle(
          color: AppColors.kWhiteAccentColor, fontSize: _subtitleSize));

  static final kTitleTextStyle = GoogleFonts.ubuntu(
      textStyle:
          TextStyle(color: AppColors.kWhiteAccentColor, fontSize: _titleSize));
}
