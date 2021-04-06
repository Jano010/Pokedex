import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/pokemon_constants.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/core/models/pokemon_models.dart';
import 'package:pokedex/core/managers/network_manager.dart';
import 'package:pokedex/ui/components/main_snackbar.dart';
import 'package:get/get.dart';
import 'package:pokedex/ui/screen/pokemon/components/type_container.dart';

class PokemonScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  static PokemonScreenController get instance => Get.find();

  final NetworkManager _network = NetworkManager.instance;

  Pokemon _pokemon;
  Pokemon get pokemon => _pokemon;

  TabController _tabController;
  TabController get tabController => _tabController;
  @override
  void onInit() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.onInit();
  }

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

  List<PokemonTypeContainer> createPokemonTypeList(List<PokemonType> typeList) {
    List<PokemonTypeContainer> pokemonTypesList = [];

    for (PokemonType pokemonType in typeList) {
      pokemonTypesList
          .add(PokemonTypeContainer(pokemonType: pokemonType.type.name));
    }

    return pokemonTypesList;
  }

  void getPokemon({@required dynamic pokemon}) async {
    if (pokemon is String) {
      if (await NetworkManager.thereIsInternetConnection()) {
        _pokemon = await _network.obtainPokemon(pokemon: pokemon);
        update();
      } else {
        MainSnackbar.show(
            title: kGenericErrorMsg, msg: 'There is no internet connection');
      }
    } else if (pokemon is Pokemon) {
      _pokemon = pokemon;
      update();
    }
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }
}
