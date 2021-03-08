import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screen/pokemon/components/pokemon_body.dart';
import 'package:get/get.dart';

class PokemonScreen extends StatelessWidget {
  final String pokemonUrl = Get.arguments;
  static const String route = "/pokemon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForthColor,
      appBar: AppBar(
        backgroundColor: kForthColor,
        elevation: 0.0,
      ),
      body: PokemonBody(
        pokemonUrl: pokemonUrl,
      ),
    );
  }
}
