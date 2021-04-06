import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:pokedex/core/utils/extensions.dart';

class GeneralInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonScreenController _controller =
        PokemonScreenController.instance;

    final TextStyle _titleStyle = TextStyle(color: kForthColor, fontSize: 24.0);
    final TextStyle _infoStyle = TextStyle(color: kThirdColor, fontSize: 16.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Weight',
                  style: _titleStyle,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${_controller.pokemon.weight / 10} kg',
                  style: _infoStyle,
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Height',
                  style: _titleStyle,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${_controller.pokemon.height / 10} m',
                  style: _infoStyle,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 32.0,
        ),
        Text('Abilities', style: _titleStyle),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (final abilities in _controller.pokemon.abilities)
              Text(
                abilities.ability.name.capitalize(),
                style: _infoStyle,
              ),
          ],
        )
      ],
    );
  }
}
