import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/core/models/pokemon_models.dart';
import 'package:pokedex/core/services/network_manager.dart';
import 'package:pokedex/ui/components/main_snackbar.dart';
import 'package:get/get.dart';

class PokemonScreenController extends GetxController {
  NetworkManager _networkManager;
  Pokemon _pokemon;

  Pokemon get pokemon => _pokemon;
  static PokemonScreenController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _pokemon = null;
    _networkManager = NetworkManager();
  }

  void getPokemon({@required String pokemon}) async {
    if (await _networkManager.thereIsInternetConnection()) {
      print('$pokemon');
      _pokemon = await _networkManager.callPokemonServices(pokemon: pokemon);
      update();
    } else {
      MainSnackbar.show(
          title: kGenericErrorMsg, msg: 'There is no internet connection');
    }
  }
}
