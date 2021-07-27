import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/utils/input_converter.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/usecases/get_pokemon.dart';
import 'package:pokedex/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex/domain/usecases/get_pokemon_species.dart';
import 'package:pokedex/domain/usecases/search_pokemon.dart';
import 'package:pokedex/presentation/navigation/app_routes.dart';
import 'package:pokedex/presentation/pages/pokemon/pokemon_arguments.dart';

class HomeController extends GetxController {
  HomeController(
      {required this.getPokemonList,
      required this.searchPokemon,
      required this.getPokemonSpecies,
      required this.getPokemon});

  // UseCases
  final GetPokemonList getPokemonList;
  final SearchPokemon searchPokemon;
  final GetPokemonSpecies getPokemonSpecies;
  final GetPokemon getPokemon;

  // UI Controllers
  late TextEditingController _textEditingController;
  TextEditingController get textEditingController => _textEditingController;
  late ScrollController _listScrollController;
  ScrollController get listController => _listScrollController;

  // UI RX variables to change page state
  RxList<ApiResource> pokemonList = <ApiResource>[].obs;
  RxBool isItLoading = false.obs;

  // Logic Variables
  String? _nextList;
  String _pokemonToSearch = "";
  String get pokemonToSearch => _pokemonToSearch;

  // Life cycle
  @override
  void onInit() {
    _textEditingController = TextEditingController();
    _listScrollController = ScrollController();
    _listScrollController.addListener(_listScrollListener);
    super.onInit();
  }

  @override
  void onReady() {
    callGetPokemonList();
    super.onReady();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  // List Logic
  Future<void> callGetPokemonList() async {
    isItLoading.value = true;

    final _apiPagination =
        await getPokemonList(PokemonListParams(url: _nextList));
    // If Left let it know to the ui to show error, on right add the pokemons to the list show
    _apiPagination.fold((l) {
      pokemonList.clear();
    }, (r) {
      // Save the url of the next pokemonlist to call when necesary
      _nextList = r.next;
      pokemonList.addAll(r.results);
    });
    isItLoading.value = false;
  }

  void _listScrollListener() {
    // Logic for lazy load elements of the list,
    // only load more elements when we reach the end of the list
    if (_listScrollController.position.pixels ==
        _listScrollController.position.maxScrollExtent) {
      callGetPokemonList();
    }
  }

  // Card Logic
  Future<bool> callGetPokemon({required ApiResource pokemonResource}) async {
    Pokemon? _pokemon;
    isItLoading.value = true;

    final _pokemonResult =
        await getPokemon(GetPokemonParams(pokemonResource: pokemonResource));
    _pokemonResult.fold((l) => _pokemon = null, (r) => _pokemon = r);
    // When pokemon found then search for the species infomartion and go to the pokemon Page
    // if the pokemon was found then _pokemon != null equals true
    final result = await getSpeciesAndGoToPokemonPage(pokemon: _pokemon);
    isItLoading.value = false;
    return result;
  }

  // Search Logic
  Future<bool> callSerchPokemon() async {
    late SearchPokemonParams _searchParams;
    Pokemon? _pokemon;
    isItLoading.value = true;

    // Transform the string on an int, if left then is text and save as name
    // if right then pokemon number as id
    final _searchInput = InputConverter.stringToInt(_pokemonToSearch);
    _searchInput.fold(
        (l) => _searchParams =
            SearchPokemonParams(name: _pokemonToSearch.toLowerCase()),
        (r) => _searchParams = SearchPokemonParams(id: r));

    // Search for pokemon, on left let ui know of an error,
    // on right past the result to the pokemon page
    final _pokemonSearchResult = await searchPokemon(_searchParams);
    _pokemonSearchResult.fold((l) => _pokemon = null, (r) => _pokemon = r);

    // When pokemon found then search for the species infomartion and go to the pokemon Page
    // if the pokemon was found then _pokemon != null equals true
    final result = await getSpeciesAndGoToPokemonPage(pokemon: _pokemon);
    isItLoading.value = false;
    return result;
  }

  void changePokemonToSearch(String newValue) => _pokemonToSearch = newValue;

  // General Lodic
  Future<bool> getSpeciesAndGoToPokemonPage({required Pokemon? pokemon}) async {
    if (pokemon != null) {
      bool result = false;
      final _pokemonSpeciesResult = await getPokemonSpecies(
          GetPokemonSpeciesParams(species: pokemon.species));
      _pokemonSpeciesResult.fold((l) {
        result = false;
      }, (r) {
        Get.toNamed(AppRoutes.kPokemonPage,
            arguments:
                PokemonPageArguments(pokemon: pokemon, pokemonSpecies: r));
        result = true;
      });
      return result;
    } else {
      return false;
    }
  }
}
