import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/pokemon_constants.dart';
import 'package:pokedex/core/managers/firebase_manager.dart';
import 'package:pokedex/core/managers/network_manager.dart';
import 'package:pokedex/core/models/pokemon_models.dart';
import 'package:pokedex/ui/screen/pokemon/components/type_container.dart';
import 'package:pokedex/ui/screen/pokemon/pokemon_screen.dart';
import 'package:pokedex/ui/screen/search/search_screen.dart';
import 'package:flutter/material.dart';

class FavouritePkmnController extends GetxController {
  static FavouritePkmnController get instance => Get.find();

  final NetworkManager _network = NetworkManager.instance;
  final FirebaseManager _fbManager = FirebaseManager.instance;

  List<Pokemon> favPokemons = [];

  void goToSearchScreen() => Get.toNamed(SearchScreen.route);

  void goToPokemonScreen(Pokemon pokemon) =>
      Get.toNamed(PokemonScreen.route, arguments: pokemon);

  void signOut() => _fbManager.signOut();

  void createFavPkmnList() async {
    DocumentSnapshot _favPkmnDocument =
        await _fbManager.retriveFavPkmnDocument();
    // ignore: unused_local_variable
    Map<String, dynamic> _documentData = _favPkmnDocument.data();

    // TODO: CHANGE HERE!

    // _documentData[_fbManager.favPkmnDocField];
    List<String> pokemonNames = ['charmander', 'donphan', 'bulbasaur'];

    for (String pokemon in pokemonNames) {
      favPokemons.add(await _network.obtainPokemon(pokemon: pokemon));
      update();
    }
  }

  Color returnCardBackGroundColor({@required String pokemonType}) {
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
}
