import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/core/errors/exceptions.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/core/utils/network_info.dart';
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
import 'package:pokedex/data/models/pokemon/pokemon_verbose_effect_model.dart';
import 'package:pokedex/data/repositories/pokemon_repository_impl.dart';

import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([PokemonRemoteDataSource, NetworkInfo])
void main() {
  late MockPokemonRemoteDataSource mockPokemonRemoteDataSource;
  late MockNetworkInfo mockNetwokInfo;
  late PokemonRepositoryImpl repository;

  late PokemonModel tPokemonModel;
  late PokemonAbilityResourceModel tPokemonAbilityResource;
  late PokemonStatModel tPokemonStatModel;
  late PokemonTypeModel tPokemonTypeModel;
  late ApiResourceModel tGeneralApiResource;
  late ApiPaginationModel tApiPaginationModel;
  late PokemonFlavortextModel tFlavorText;
  late PokemonSpeciesModel tPokemonSpecies;
  late PokemonVerboseEffectModel tPokemonVerbose;
  late PokemonAbilityModel tPokemonAbility;

  setUp(() {
    mockNetwokInfo = MockNetworkInfo();
    mockPokemonRemoteDataSource = MockPokemonRemoteDataSource();
    repository = PokemonRepositoryImpl(
        remoteDataSource: mockPokemonRemoteDataSource,
        networkInfo: mockNetwokInfo);

    tGeneralApiResource = ApiResourceModel(name: "name", url: "url");
    tApiPaginationModel = ApiPaginationModel(
        count: 1,
        next: "url",
        previous: "url",
        results: [tGeneralApiResource, tGeneralApiResource]);
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
        flavor_text: "",
        language: tGeneralApiResource,
        version: tGeneralApiResource);
    tPokemonSpecies = PokemonSpeciesModel(
        gender_rate: 1,
        capture_rate: 1,
        growth_rate: tGeneralApiResource,
        hatch_counter: 2,
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

  // GetPokemon
  group("Get Pokemon: ", () {
    test(
        "Calling GetPokemon method while being online then return a right(Pokemon) object ",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected).thenAnswer((_) async => true);
      when(mockPokemonRemoteDataSource.getPokemon(tGeneralApiResource))
          .thenAnswer((_) async => tPokemonModel);

      // Act
      final result = await repository.getPokemon(tGeneralApiResource);

      // Assert
      expect(result, right(tPokemonModel));
      verify(mockNetwokInfo.isConnected);
      verify(mockPokemonRemoteDataSource.getPokemon(tGeneralApiResource));
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling GetPokemon while being offline Then return a connection failure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected).thenAnswer((_) async => false);
      when(mockPokemonRemoteDataSource.getPokemon(tGeneralApiResource))
          .thenAnswer((_) async => tPokemonModel);

      // Act
      final result = await repository.getPokemon(tGeneralApiResource);

      // Assert
      expect(result, left(ConnectionFailure()));
      verify(mockNetwokInfo.isConnected);
      verifyZeroInteractions(mockPokemonRemoteDataSource);
    });

    test("Calling GetPokemon while online Then throw a server exception",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected).thenAnswer((_) async => true);
      when(mockPokemonRemoteDataSource.getPokemon(tGeneralApiResource))
          .thenThrow(ServerException());

      // Act
      final result = await repository.getPokemon(tGeneralApiResource);

      // Assert
      expect(result, left(ServerFailure()));
      verify(mockNetwokInfo.isConnected);
      verify(mockPokemonRemoteDataSource.getPokemon(tGeneralApiResource));
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });
  });

  // GetPokemonSpecies
  group("GetPokemonSpecies: ", () {
    test(
        "Calling the method with internet connection and not erros must return a right PokemonSpecies object",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.getPokemonSpeceies(tGeneralApiResource))
          .thenAnswer((realInvocation) async => tPokemonSpecies);

      // Act
      final result = await repository.getPokemonSpecies(tGeneralApiResource);

      // Assert
      expect(result, right(tPokemonSpecies));
      verify(mockNetwokInfo.isConnected);
      verify(
          mockPokemonRemoteDataSource.getPokemonSpeceies(tGeneralApiResource));
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method whithout internet coneection must return Coonection Failure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => false);
      // Act
      final result = await repository.getPokemonSpecies(tGeneralApiResource);
      // Assert
      expect(result, left(ConnectionFailure()));
      verify(mockNetwokInfo.isConnected);
      verifyZeroInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method when there is internet connection but there are server erros must return ServerFailure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.getPokemonSpeceies(tGeneralApiResource))
          .thenThrow(ServerException());

      // act
      final result = await repository.getPokemonSpecies(tGeneralApiResource);

      // Assert
      expect(result, left(ServerFailure()));
      verify(mockNetwokInfo.isConnected);
      verify(
          mockPokemonRemoteDataSource.getPokemonSpeceies(tGeneralApiResource));
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });
  });

  // SearchPokemon
  group("SearchPokemon: ", () {
    test(
        "Calling the method whith internet connection and no error then return a Pokemon object",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.searchPokemon(any, any))
          .thenAnswer((realInvocation) async => tPokemonModel);
      // act
      final result = await repository.searchPokemon(1, "name");
      // Assert
      expect(result, right(tPokemonModel));
      verify(mockNetwokInfo.isConnected);
      verify(mockPokemonRemoteDataSource.searchPokemon(any, any));
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method whithout internet connection then return a ConnectionFailure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => false);
      // act
      final result = await repository.searchPokemon(1, "name");
      // Assert
      expect(result, left(ConnectionFailure()));
      verify(mockNetwokInfo.isConnected);
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyZeroInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method whith internet connection and a server exception then return a ServeFailure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.searchPokemon(any, any))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchPokemon(1, "name");
      // Assert
      expect(result, left(ServerFailure()));
      verify(mockNetwokInfo.isConnected);
      verify(mockPokemonRemoteDataSource.searchPokemon(any, any));
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });
  });

  group("GetPokemonList: ", () {
    test(
        "Calling the method whith internet connection and no error then return a ApiPaginationObject",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.getPokemonList(any))
          .thenAnswer((realInvocation) async => tApiPaginationModel);
      // act
      final result = await repository.getPokemonList("url");
      // Assert
      expect(result, right(tApiPaginationModel));
      verify(mockNetwokInfo.isConnected);
      verify(mockPokemonRemoteDataSource.getPokemonList(any));
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method whithout internet connection then return a ConnectionFailure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => false);
      // act
      final result = await repository.getPokemonList("url");
      // Assert
      expect(result, left(ConnectionFailure()));
      verify(mockNetwokInfo.isConnected);
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyZeroInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method whith internet connection and a server exception then return a ServeFailure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.getPokemonList(any))
          .thenThrow(ServerException());
      // act
      final result = await repository.getPokemonList("url");
      // Assert
      expect(result, left(ServerFailure()));
      verify(mockNetwokInfo.isConnected);
      verify(mockPokemonRemoteDataSource.getPokemonList(any));
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });
  });

  group("GetPokemonAbility: ", () {
    test(
        "Calling the method whith internet connection and no error then return a PokemonAbility object",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.getPokemonAbility(tGeneralApiResource))
          .thenAnswer((realInvocation) async => tPokemonAbility);
      // act
      final result = await repository.getPokemonAbility(tGeneralApiResource);
      // Assert
      expect(result, right(tPokemonAbility));
      verify(mockNetwokInfo.isConnected);
      verify(
          mockPokemonRemoteDataSource.getPokemonAbility(tGeneralApiResource));
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method whithout internet connection then return a ConnectionFailure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => false);
      // act
      final result = await repository.getPokemonAbility(tGeneralApiResource);
      // Assert
      expect(result, left(ConnectionFailure()));
      verify(mockNetwokInfo.isConnected);
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyZeroInteractions(mockPokemonRemoteDataSource);
    });

    test(
        "Calling the method whith internet connection and a server exception then return a ServeFailure",
        () async {
      // Arrange
      when(mockNetwokInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockPokemonRemoteDataSource.getPokemonAbility(tGeneralApiResource))
          .thenThrow(ServerException());
      // act
      final result = await repository.getPokemonAbility(tGeneralApiResource);
      // Assert
      expect(result, left(ServerFailure()));
      verify(mockNetwokInfo.isConnected);
      verify(
          mockPokemonRemoteDataSource.getPokemonAbility(tGeneralApiResource));
      verifyNoMoreInteractions(mockNetwokInfo);
      verifyNoMoreInteractions(mockPokemonRemoteDataSource);
    });
  });
}
