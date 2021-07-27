import 'package:get/get.dart';
import 'package:pokedex/presentation/navigation/app_routes.dart';
import 'package:pokedex/presentation/pages/animation/animation_bindings.dart';
import 'package:pokedex/presentation/pages/animation/animation_page.dart';
import 'package:pokedex/presentation/pages/home/home_bindings.dart';
import 'package:pokedex/presentation/pages/home/home_page.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_bindings.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_page.dart';

class AppPages {
  static final homePage = GetPage(
      name: AppRoutes.kHomePage,
      page: () => HomePage(),
      binding: HomeBindings());
  static final pokemonPage = GetPage(
      name: AppRoutes.kPokemonPage,
      page: () => PokemonPage(),
      binding: PokemonBindings());
  static final animationPage = GetPage(
      name: AppRoutes.kAnimationPage,
      page: () => AnimationPage(),
      binding: AnimationBindings());

  static final pageList = [homePage, pokemonPage, animationPage];
}
