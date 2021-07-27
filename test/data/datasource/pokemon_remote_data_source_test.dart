import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/core/errors/exceptions.dart';
import 'package:pokedex/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex/data/models/api/api_pagination_model.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_ability_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_ability_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_flavor_text_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_species_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_stat_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_type_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/data/models/pokemon/pokemon_verbose_effect_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_verbose_effect.dart';

import '../../fixtures/fixture_reader.dart';
import 'pokemon_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late PokemonRemoteDataSource dataSource;

  late PokemonModel tPokemonModel;
  late PokemonAbilityResourceModel tPokemonAbilityResource;
  late PokemonStatModel tPokemonStatModel;
  late PokemonTypeModel tPokemonTypeModel;
  late ApiResourceModel tGeneralApiResource;
  late ApiPaginationModel tApiPaginationModel;
  late PokemonFlavortextModel tFlavorText;
  late PokemonSpeciesModel tPokemonSpecies;

  late PokemonAbilityModel tPokemonAbility;
  late PokemonVerboseEffectModel tPokemonVerbose;

  setUp(() {
    mockClient = MockClient();
    dataSource = PokemonRemoteDatesourceImpl(httpClient: mockClient);

    tGeneralApiResource = ApiResourceModel(name: "name", url: "url");
    tApiPaginationModel = ApiPaginationModel(
        count: 1,
        next: "next",
        previous: "previous",
        results: [tGeneralApiResource]);
    tPokemonAbilityResource = PokemonAbilityResourceModel(
        is_hidden: false, slot: 1, ability: tGeneralApiResource);
    tPokemonStatModel =
        PokemonStatModel(stat: tGeneralApiResource, effort: 1, base_stat: 1);
    tPokemonTypeModel = PokemonTypeModel(slot: 1, type: tGeneralApiResource);
    tPokemonModel = PokemonModel(
        id: 1,
        name: "name",
        height: 1,
        weight: 1,
        abilities: [tPokemonAbilityResource, tPokemonAbilityResource],
        sprite:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
        species: tGeneralApiResource,
        stats: [tPokemonStatModel, tPokemonStatModel],
        types: [tPokemonTypeModel, tPokemonTypeModel]);
    tFlavorText = PokemonFlavortextModel(
        flavor_text: "Flavor Text",
        language: tGeneralApiResource,
        version: tGeneralApiResource);
    tPokemonSpecies = PokemonSpeciesModel(
        gender_rate: 1,
        capture_rate: 1,
        growth_rate: tGeneralApiResource,
        hatch_counter: 1,
        egg_groups: [tGeneralApiResource, tGeneralApiResource],
        flavor_text_entries: [tFlavorText, tFlavorText]);
    tPokemonVerbose = PokemonVerboseEffectModel(
        effect: "effect",
        short_effect: "short_effect",
        language: tGeneralApiResource);
    tPokemonAbility = PokemonAbilityModel(
        id: 1,
        name: "name",
        effect_entries: [tPokemonVerbose, tPokemonVerbose]);
  });

  group("GetPokemon", () {
    test(
        "Calling the method and obtaining a good response then return a Pokemon Model",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_response.json"), 200));

      // Act
      final result = await dataSource.getPokemon(tGeneralApiResource);

      // Assert
      expect(result, tPokemonModel);
    });

    test(
        "Calling the method and obtaining a bad response then throw server exception",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_response.json"), 404));

      // Act
      final call = dataSource.getPokemon;

      // Assert
      expect(() => call(tGeneralApiResource),
          throwsA(TypeMatcher<ServerException>()));
    });
  });

  group("GetPokemonList", () {
    test(
        "Calling the method and obtaining a good response then return a ApiPagination",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("api_pagination.json"), 200));

      // Act
      final result = await dataSource.getPokemonList(null);

      // Assert
      expect(result, tApiPaginationModel);
    });

    test(
        "Calling the method and obtaining a bad response then throw server exception",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_response.json"), 404));

      // Act
      final call = dataSource.getPokemonList;

      // Assert
      expect(() => call(null), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group("GetPokemonSpecies", () {
    test(
        "Calling the method and obtaining a good response then return a Pokemon Species",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_species.json"), 200));

      // Act
      final result = await dataSource.getPokemonSpeceies(tGeneralApiResource);

      // Assert
      expect(result, tPokemonSpecies);
    });

    test(
        "Calling the method and obtaining a bad response then throw server exception",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_response.json"), 404));

      // Act
      final call = dataSource.getPokemonSpeceies;

      // Assert
      expect(() => call(tGeneralApiResource),
          throwsA(TypeMatcher<ServerException>()));
    });
  });

  group("SearchPokemon", () {
    test(
        "Calling the method and obtaining a good response then return a Pokemon",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_response.json"), 200));

      // Act
      final result = await dataSource.searchPokemon(1, null);

      // Assert
      expect(result, tPokemonModel);
    });

    test(
        "Calling the method and obtaining a bad response then throw server exception",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_response.json"), 404));

      // Act
      final call = dataSource.searchPokemon;

      // Assert
      expect(() => call(1, null), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group("GetPokemonAbility ", () {
    test(
        "Calling the method and obtaining a good response then return a PokemonAbility",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_ability.json"), 200));

      // Act
      final result = await dataSource.getPokemonAbility(tGeneralApiResource);

      // Assert
      expect(result, tPokemonAbility);
    });

    test(
        "Calling the method and obtaining a bad response then throw server exception",
        () async {
      // Arrange
      when(mockClient.get(any)).thenAnswer((realInvocation) async =>
          http.Response(fixture("pokemon_response.json"), 404));

      // Act
      final call = dataSource.getPokemonAbility;

      // Assert
      expect(() => call(tGeneralApiResource),
          throwsA(TypeMatcher<ServerException>()));
    });
  });
}
