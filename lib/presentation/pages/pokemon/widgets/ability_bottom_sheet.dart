import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_verbose_effect.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_controller.dart';
import 'package:pokedex/presentation/pages/pokemon/utils/pokemon_page_utils.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';

class AbilityBottomSheet extends GetView<PokemonController> {
  AbilityBottomSheet({required this.pokemonAbility});
  final PokemonAbility? pokemonAbility;

  String abilityShortEffect() {
    String shortEffect = "";
    for (PokemonVerboseEffect verboseEffect in pokemonAbility!.effect_entries) {
      if (verboseEffect.language.name == "en") {
        shortEffect = verboseEffect.short_effect;
      }
    }
    return shortEffect;
  }

  String abilityLongEffect() {
    String longEffect = "";
    for (PokemonVerboseEffect verboseEffect in pokemonAbility!.effect_entries) {
      if (verboseEffect.language.name == "en") {
        longEffect = verboseEffect.effect;
      }
    }
    return longEffect;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:
            PokemonPageUtils.getPokemonTypeColor(pokemon: controller.pokemon),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Effect",
            style: AppTextThemes.kSubtitleTextStyle,
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white24,
            ),
            child: Text(
              abilityShortEffect(),
              style: AppTextThemes.kBodyTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
