import 'package:get/get.dart';
import 'package:pokedex/core/bindings/base_binding.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:pokedex/core/models/pokemon_models.dart';

class PokemonScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<PokemonScreenController>(() => PokemonScreenController());
  }
}
