import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/utils/extensions.dart';

class PokemonTypeContainer extends StatelessWidget {
  String pokemonType;

  PokemonTypeContainer({@required this.pokemonType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(36)),
            color: Color(0x26000000)),
        child: Text(
          pokemonType.capitalize(),
          style: TextStyle(
            fontFamily: kCircularStdFont,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}