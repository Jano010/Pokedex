import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex/presentation/pages/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        getPokemonList: Get.find(),
        searchPokemon: Get.find(),
        getPokemonSpecies: Get.find(),
        getPokemon: Get.find()));
  }
}
