import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pokedex/core/utils/network_info.dart';
import 'package:pokedex/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemon.dart';
import 'package:pokedex/domain/usecases/get_pokemon_ability.dart';
import 'package:pokedex/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex/domain/usecases/get_pokemon_species.dart';
import 'package:pokedex/domain/usecases/search_pokemon.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    final find = Get.find;

    // External
    Get.lazyPut<http.Client>(() => http.Client(), fenix: true);
    Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker(),
        fenix: true);

    // Core
    Get.lazyPut<NetworkInfo>(
        () => NetworkInfoImpl(internetConnectionChecker: find()),
        fenix: true);

    // Data Sources
    Get.lazyPut<PokemonRemoteDataSource>(
        () => PokemonRemoteDatesourceImpl(httpClient: find()),
        fenix: true);

    // Repositories
    Get.lazyPut<PokemonRepository>(
        () => PokemonRepositoryImpl(
            remoteDataSource: find(), networkInfo: find()),
        fenix: true);

    // Use Cases
    Get.lazyPut(() => GetPokemonList(find()), fenix: true);
    Get.lazyPut(() => GetPokemonSpecies(find()), fenix: true);
    Get.lazyPut(() => SearchPokemon(find()), fenix: true);
    Get.lazyPut(() => GetPokemon(find()), fenix: true);
    Get.lazyPut(() => GetPokemonAbility(find()), fenix: true);
  }
}
