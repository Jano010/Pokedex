import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex/core/constants/styles_constants.dart';
import 'package:pokedex/core/controllers/favouritePkmn_controller.dart';
import 'package:pokedex/core/models/pokemon_models.dart';
import 'package:pokedex/ui/screen/favourite_pkmn/components/favouritePkmn_card.dart';

class FavouritePkmnGrid extends StatefulWidget {
  @override
  _FavouritePkmnGridState createState() => _FavouritePkmnGridState();
}

class _FavouritePkmnGridState extends State<FavouritePkmnGrid> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritePkmnController>(
        initState: (_) => FavouritePkmnController.instance.createFavPkmnList(),
        builder: (controller) => controller.favPokemons.isEmpty
            ? Center(
                child: Container(
                child: Text(
                  'You dont have favourites Pokemons',
                  style: kParagraphStyle,
                ),
              ))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: controller.favPokemons.length,
                    itemBuilder: (context, index) {
                      Pokemon pokemon = controller.favPokemons[index];
                      return GestureDetector(
                        onTap: () => controller.goToPokemonScreen(pokemon),
                        child: FavouritePkmnCard(
                          pokemon: pokemon,
                          backGroundColor: controller.returnCardBackGroundColor(
                              pokemonType: pokemon.types[0].type.name),
                          pokemonTypeList:
                              controller.createPokemonTypeList(pokemon.types),
                        ),
                      );
                    }),
              ));
  }
}
