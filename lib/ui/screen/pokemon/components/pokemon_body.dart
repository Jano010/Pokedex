import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/styles_constants.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:pokedex/core/utils/extensions.dart';
import 'package:pokedex/ui/screen/pokemon/components/pokemonInfo_sheet.dart';

class PokemonBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonScreenController _controller =
        PokemonScreenController.instance;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Hero(
            tag: 'logo',
            child: SvgPicture.asset(
              'assets/logo_corner.svg',
              color: kMainColorOpacity40,
              height: 140.0,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_controller.pokemon.name.capitalize()}',
                            style: kTitleStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: _controller.createPokemonTypeList(
                                _controller.pokemon.types),
                          )
                        ]),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: kMainColor,
                  ),
                ],
              ),
            ),
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${_controller.pokemon.id}.png',
              height: MediaQuery.of(context).size.height / 3,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.0))),
                child: PokemonInfoSheet(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
