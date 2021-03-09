import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/models/pokemon_models.dart';
import 'package:pokedex/ui/screen/pokemon/components/type_container.dart';

class PokemonBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokemonScreenController controller = Get.find();
    Pokemon pokemon = controller.pokemon;

    List<PokemonTypeContainer> pokemonTypes = [];

    // Obtaining all the types of the pokemonn
    for (int i = 0; i < pokemon.types.length; i++) {
      pokemonTypes
          .add(PokemonTypeContainer(pokemonType: pokemon.types[i].type.name));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemon.name.capitalize,
                style: TextStyle(
                    fontFamily: kCircularStdFont,
                    color: Colors.white,
                    fontSize: 40.0),
              ),
              Text(
                '#${pokemon.id.toString()}',
                style: TextStyle(
                    fontFamily: kCircularStdFont,
                    color: Colors.white,
                    fontSize: 28.0),
              )
            ],
          ),
        ),
        Row(
          children: pokemonTypes,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            pokemon.sprites.front_default,
            scale: 0.3,
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36))),
            child: Center(
              child: Text("PUT INFO HERE"),
            ),
          ),
        ),
      ],
    );
  }
}
