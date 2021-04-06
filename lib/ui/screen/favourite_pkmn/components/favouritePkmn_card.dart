import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/styles_constants.dart';
import 'package:pokedex/core/models/pokemon_models.dart';
import 'package:pokedex/ui/screen/pokemon/components/type_container.dart';
import 'package:pokedex/core/utils/extensions.dart';

class FavouritePkmnCard extends StatelessWidget {
  final Pokemon pokemon;
  final Color backGroundColor;
  final List<PokemonTypeContainer> pokemonTypeList;

  FavouritePkmnCard(
      {@required this.pokemon,
      @required this.backGroundColor,
      @required this.pokemonTypeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      child: Card(
        elevation: 4,
        color: backGroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png',
              height: MediaQuery.of(context).size.height / 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  pokemon.name.capitalize(),
                  style: kParagraphStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemonTypeList,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
