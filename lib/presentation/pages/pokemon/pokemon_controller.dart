import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';
import 'package:pokedex/domain/usecases/get_pokemon_ability.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_arguments.dart';

class PokemonController extends GetxController
    with SingleGetTickerProviderMixin {
  PokemonController({required this.getPokemonAbility});

  final GetPokemonAbility getPokemonAbility;

  // Arguments variables
  late PokemonPageArguments _args;
  Pokemon get pokemon => _args.pokemon;
  PokemonSpecies get pokemonSpecies => _args.pokemonSpecies;

  // UI Controllers
  late TabController _tabController;
  TabController get tabController => _tabController;

  // General UI Varibles
  final int _noOfTabs = 3;

  // Lifecycle
  @override
  void onInit() {
    _args = Get.arguments;
    _tabController = TabController(length: _noOfTabs, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Cards Logic
  Future<PokemonAbility?> callGetPokemonAblitity(
      {required ApiResource ability}) async {
    PokemonAbility? _pokemonAbility;
    final result = await getPokemonAbility(
        GetPokemonAbilityParams(abilityResource: ability));
    result.fold((l) => _pokemonAbility = null, (r) => _pokemonAbility = r);
    return _pokemonAbility;
  }
}
