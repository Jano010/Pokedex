import 'package:flutter/cupertino.dart';
import 'package:pokedex/core/errors/exceptions.dart';
import 'package:pokedex/data/models/api/api_pagination_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_ability_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_species_model.dart';
import 'package:pokedex/domain/entities/api/api_pagination.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';
import 'package:http/http.dart' as http;

abstract class PokemonRemoteDataSource {
  // Calls https://pokeapi.co/api/v2/pokemon/{pokemon} endpoint
  Future<Pokemon> getPokemon(ApiResource pokemon);
  // Calls https://pokeapi.co/api/v2/pokemon/{id or name} endpoint
  Future<Pokemon> searchPokemon(int? id, String? name);
  // Calls https://pokeapi.co/api/v2/pokemon-species/{id or name} endpoint
  Future<PokemonSpecies> getPokemonSpeceies(ApiResource species);
  // Calls https://pokeapi.co/api/v2/pokemon endpoint
  Future<ApiPagination> getPokemonList(String? url);
  // Calls https://pokeapi.co/api/v2/ability/ endpoints
  Future<PokemonAbility> getPokemonAbility(ApiResource ability);

  // Everyone throws an Server exception in case of error.
}

class PokemonRemoteDatesourceImpl extends PokemonRemoteDataSource {
  PokemonRemoteDatesourceImpl({required this.httpClient});

  final http.Client httpClient;

  static const String pokemonUrl = "https://pokeapi.co/api/v2/";

  @override
  Future<Pokemon> getPokemon(ApiResource pokemon) async {
    final url = Uri.parse(pokemon.url);
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ApiPagination> getPokemonList(String? url) async {
    final listUrl =
        url == null ? Uri.parse(pokemonUrl + "pokemon") : Uri.parse(url);
    final response = await httpClient.get(listUrl);

    if (response.statusCode == 200) {
      return ApiPaginationModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonSpecies> getPokemonSpeceies(ApiResource species) async {
    final url = Uri.parse(species.url);
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      return PokemonSpeciesModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Pokemon> searchPokemon(int? id, String? name) async {
    final String mainUrl = pokemonUrl + "pokemon/";
    final url = id != null
        ? Uri.parse(mainUrl + "$id")
        : Uri.parse(mainUrl + "${name?.toLowerCase()}");
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonAbility> getPokemonAbility(ApiResource ability) async {
    final url = Uri.parse(ability.url);
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      return PokemonAbilityModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
