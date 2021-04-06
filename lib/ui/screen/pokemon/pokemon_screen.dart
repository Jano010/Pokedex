import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:pokedex/ui/screen/pokemon/components/pokemon_body.dart';
import 'package:get/get.dart';

class PokemonScreen extends StatelessWidget {
  final dynamic pokemon = Get.arguments;
  static const String route = "/pokemon";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonScreenController>(
        initState: (_) =>
            PokemonScreenController.instance.getPokemon(pokemon: pokemon),
        builder: (controller) {
          bool isPokemonReady = controller.pokemon != null;
          Color backGroundColor = kForthColor;

          if (isPokemonReady) {
            backGroundColor = controller.returnBackGroundColor(
                pokemonType: controller.pokemon.types[0].type.name);
          }

          return isPokemonReady
              ? Scaffold(
                  backgroundColor: backGroundColor,
                  body: SafeArea(child: PokemonBody()),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
