import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/presentation/pages/home/home_controller.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';

class PokemonListTile extends GetView<HomeController> {
  PokemonListTile({required this.index, required this.pokemonResource});

  final ApiResource pokemonResource;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: AppColors.kWhiteAccentColor,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: ListTile(
          onTap: () async {
            final succefulResult = await controller.callGetPokemon(
                pokemonResource: pokemonResource);
            if (!succefulResult) {
              Get.snackbar("Pokemon", "Couldn't find the pokemon",
                  colorText: AppColors.kWhiteAccentColor,
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: AppColors.kErrorColor);
            }
          },
          title: Text(
            "#${index + 1} ${pokemonResource.name.capitalizeFirst}",
            style: AppTextThemes.kBodyTextStyle
                .copyWith(color: AppColors.kBackGroundColor),
          ),
        ),
      ),
    );
  }
}
