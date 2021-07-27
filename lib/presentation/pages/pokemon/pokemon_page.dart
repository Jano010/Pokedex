// ignore: implementation_imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_type.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_controller.dart';
import 'package:pokedex/presentation/pages/pokemon/utils/pokemon_page_utils.dart';
import 'package:pokedex/presentation/pages/pokemon/widgets/pokemon_about_tab.dart';
import 'package:pokedex/presentation/pages/pokemon/widgets/pokemon_stats_tab.dart';
import 'package:pokedex/presentation/pages/pokemon/widgets/pokemon_type_container.dart';
import 'package:pokedex/presentation/pages/pokemon/widgets/pokemons_abilities_tab.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';
import 'package:pokedex/presentation/utils/constants/app_assets.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';
import 'package:pokedex/presentation/utils/constants/app_strings.dart';

class PokemonPage extends GetView<PokemonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          PokemonPageUtils.getPokemonTypeColor(pokemon: controller.pokemon),
      body: SafeArea(child: PokemonBody()),
    );
  }
}

class PokemonBody extends GetView<PokemonController> {
  List<Widget> pokemonTypes() {
    List<Widget> types = [];
    for (PokemonType pokemonType in controller.pokemon.types) {
      types.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: PokemonTypeContainer(type: pokemonType.type.name),
      ));
    }
    return types;
  }

  String pokemonNumber({required int pokemonNumber}) {
    if (pokemonNumber < 10) {
      return "#00$pokemonNumber";
    } else if (pokemonNumber < 100) {
      return "#0$pokemonNumber";
    } else {
      return "#$pokemonNumber";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title and number
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.pokemon.name.capitalizeFirst!,
                  style: AppTextThemes.kTitleTextStyle,
                ),
                Text(
                  pokemonNumber(pokemonNumber: controller.pokemon.id),
                  style: AppTextThemes.kSubtitleTextStyle,
                )
              ],
            ),
          ),
        ),
        // Types
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: pokemonTypes(),
            ),
          ),
        ),
        // Sprite and Info Card
        Expanded(
          flex: 7,
          child: Stack(children: [
            // Logo
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: AppStrings.kLogoHeroAnimation,
                child: SvgPicture.asset(
                  AppAssets.kMainLogo,
                  color: Colors.white38,
                ),
              ),
            ),
            // Card Tabulator
            Padding(
              padding: EdgeInsets.only(top: Get.width / 3),
              child: Container(
                padding: EdgeInsets.only(top: Get.width / 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child:
                          TabBar(controller: controller.tabController, tabs: [
                        Tab(
                          child: Text(
                            "About",
                            style: AppTextThemes.kButtonTextStyle
                                .copyWith(color: AppColors.kBackGroundColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Base Stats",
                            style: AppTextThemes.kButtonTextStyle
                                .copyWith(color: AppColors.kBackGroundColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Abilities",
                            style: AppTextThemes.kButtonTextStyle
                                .copyWith(color: AppColors.kBackGroundColor),
                          ),
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TabBarView(
                            controller: controller.tabController,
                            children: [
                              SingleChildScrollView(
                                child: PokemonAboutTab(
                                    pokemon: controller.pokemon,
                                    species: controller.pokemonSpecies),
                              ),
                              SingleChildScrollView(
                                child: PokemonStatTab(
                                    pokemon: controller.pokemon,
                                    species: controller.pokemonSpecies),
                              ),
                              PokemonAbilitiesTab(pokemon: controller.pokemon),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Sṕrite
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                controller.pokemon.sprite,
                width: Get.width / 2,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
