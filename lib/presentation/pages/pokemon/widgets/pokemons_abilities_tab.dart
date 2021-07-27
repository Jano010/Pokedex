import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability_resource.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_controller.dart';
import 'package:pokedex/presentation/pages/pokemon/utils/pokemon_page_utils.dart';
import 'package:pokedex/presentation/pages/pokemon/widgets/ability_bottom_sheet.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';

class PokemonAbilitiesTab extends StatelessWidget {
  PokemonAbilitiesTab({required this.pokemon});

  final Pokemon pokemon;

  List<Widget> pokemonMoves() {
    List<Widget> list = [];

    for (PokemonAbilityResource abilityResource in pokemon.abilities) {
      list.add(PokemonAbilityCard(
          pokemon: pokemon, abilityResource: abilityResource));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Expanded(
        child: GridView.count(
          childAspectRatio: 3.0,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: pokemonMoves(),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ),
    );
  }
}

class PokemonAbilityCard extends GetView<PokemonController> {
  const PokemonAbilityCard({
    Key? key,
    required this.pokemon,
    required this.abilityResource,
  }) : super(key: key);

  final Pokemon pokemon;
  final PokemonAbilityResource abilityResource;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PokemonPageUtils.getPokemonTypeColor(pokemon: pokemon),
      elevation: 8.0,
      child: Center(
          child: ListTile(
        onTap: () async {
          final PokemonAbility? ability = await controller
              .callGetPokemonAblitity(ability: abilityResource.ability);
          Get.bottomSheet(AbilityBottomSheet(pokemonAbility: ability));
        },
        title: Text(
          abilityResource.ability.name.capitalizeFirst!,
          textAlign: TextAlign.center,
          style: AppTextThemes.kBodyTextStyle,
        ),
      )),
    );
  }
}
