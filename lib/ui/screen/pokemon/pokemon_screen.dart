import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/pokemon_constants.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:pokedex/ui/screen/pokemon/components/pokemon_body.dart';
import 'package:get/get.dart';

class PokemonScreen extends StatelessWidget {
  final String pokemonUrl = Get.arguments;
  static const String route = "/pokemon";

  Color returnBackGroundColor({@required String pokemonType}) {
    switch (pokemonType) {
      case kNormalType:
        return kNormalTypeColor;
        break;
      case kFightingType:
        return kFightingTypeColor;
        break;
      case kFlyingType:
        return kFlyingTypeColor;
        break;
      case kPoisonType:
        return kPoisonTypeColor;
        break;
      case kNGroundType:
        return kGroundTypeColor;
        break;
      case kRockType:
        return kRockTypeColor;
        break;
      case kBugType:
        return kBugTypeColor;
        break;
      case kGhostType:
        return kGhostTypeColor;
        break;
      case kSteelType:
        return kSteelTypeColor;
        break;
      case kFireType:
        return kFireTypeColor;
        break;
      case kWaterType:
        return kWaterTypeColor;
        break;
      case kGrassType:
        return kGrassTypeColor;
        break;
      case kElectricType:
        return kElectricTypecolor;
        break;
      case kIceType:
        return kIceTypeColor;
        break;
      case kDragonType:
        return kDragonTypeColor;
        break;
      case kDarkType:
        return kDarkTypeColor;
        break;
      case kFairyType:
        return kFairyTypeColor;
        break;
      case kPsychicType:
        return kPsychicTypeColor;
        break;
      default:
        return kForthColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonScreenController>(
        initState: (_) =>
            PokemonScreenController.to.getPokemon(pokemon: pokemonUrl),
        builder: (controller) {
          bool isPokemonReady = controller.pokemon != null;
          Color backGroundColor = kForthColor;

          if (isPokemonReady) {
            backGroundColor = returnBackGroundColor(
                pokemonType: controller.pokemon.types[0].type.name);
          }

          return isPokemonReady
              ? Scaffold(
                  backgroundColor: backGroundColor,
                  appBar: AppBar(
                    backgroundColor: backGroundColor,
                    elevation: 0.0,
                  ),
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: PokemonBody(),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
