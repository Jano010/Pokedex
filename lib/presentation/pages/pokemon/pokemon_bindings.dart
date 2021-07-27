import 'package:get/instance_manager.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_controller.dart';

class PokemonBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonController(getPokemonAbility: Get.find()));
  }
}
