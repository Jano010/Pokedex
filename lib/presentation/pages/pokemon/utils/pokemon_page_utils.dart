import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';

class PokemonPageUtils {
  static Color getPokemonTypeColor({required Pokemon pokemon}) {
    switch (pokemon.types[0].type.name) {
      case "bug":
        return AppColors.kBugTypeColor;
      case "dark":
        return AppColors.kDarkTypeColor;
      case "dragon":
        return AppColors.kDragonTypeColor;
      case "electric":
        return AppColors.kElectricTypecolor;
      case "fairy":
        return AppColors.kFairyTypeColor;
      case "fighting":
        return AppColors.kFightingTypeColor;
      case "fire":
        return AppColors.kFireTypeColor;
      case "flying":
        return AppColors.kFlyingTypeColor;
      case "ghost":
        return AppColors.kGhostTypeColor;
      case "grass":
        return AppColors.kGrassTypeColor;
      case "ground":
        return AppColors.kGroundTypeColor;
      case "ice":
        return AppColors.kIceTypeColor;
      case "normal":
        return AppColors.kNormalTypeColor;
      case "poison":
        return AppColors.kPoisonTypeColor;
      case "psychic":
        return AppColors.kPsychicTypeColor;
      case "rock":
        return AppColors.kRockTypeColor;
      case "steel":
        return AppColors.kSteelTypeColor;
      case "water":
        return AppColors.kWaterTypeColor;
      default:
        return AppColors.kNormalTypeColor;
    }
  }
}
