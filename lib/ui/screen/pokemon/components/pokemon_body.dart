import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';

class PokemonBody extends StatelessWidget {
  PokemonBody({this.pokemonUrl = ''});
  final String pokemonUrl;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonScreenController>(
      initState: (_) =>
          PokemonScreenController.to.getPokemon(pokemon: pokemonUrl),
      builder: (controller) => controller.pokemon == null
          ? Center(child: CircularProgressIndicator())
          : Container(),
    );
  }
}
