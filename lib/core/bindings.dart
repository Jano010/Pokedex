import 'package:get/get.dart';
import 'package:pokedex/core/controllers/animationScreen_controller.dart';
import 'package:pokedex/core/controllers/authenticationScreen_controller.dart';
import 'package:pokedex/core/controllers/favouritePkmn_controller.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:pokedex/core/controllers/searchScreen_controller.dart';
import 'package:pokedex/core/controllers/welcomeScreen_controller.dart';
import 'package:pokedex/core/managers/firebase_manager.dart';
import 'package:pokedex/core/managers/network_manager.dart';

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseManager>(() => FirebaseManager());
    Get.lazyPut<NetworkManager>(() => NetworkManager());
  }
}

class AnimationScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AnimationScreenController>(() => AnimationScreenController());
  }
}

class WelcomeScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<WelcomeScreenController>(() => WelcomeScreenController());
  }
}

class AuthenticationScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AuthenticationScreenController>(
        () => AuthenticationScreenController());
  }
}

class FavouritePkmnScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<FavouritePkmnController>(() => FavouritePkmnController());
  }
}

class SearchScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<SearchScreenController>(() => SearchScreenController());
  }
}

class PokemonScreenBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<PokemonScreenController>(() => PokemonScreenController());
  }
}
