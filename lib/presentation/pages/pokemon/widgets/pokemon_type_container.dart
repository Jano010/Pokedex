import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';

class PokemonTypeContainer extends StatelessWidget {
  PokemonTypeContainer({required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(width: 8.0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(20.0)),
      child: Text(
        type.capitalizeFirst!,
        style: AppTextThemes.kBodyTextStyle,
      ),
    );
  }
}
