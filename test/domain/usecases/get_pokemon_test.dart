import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_stat.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_type.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemon.dart';
import 'get_pokemon_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemon usecase;
  late MockPokemonRepository mockPokemonRepository;
  late ApiResource tPokemonResource;
  late ApiResource tGeneralResource;
  late Pokemon tPokemon;

  // Arrange: Setup all needed for the test
  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemon(mockPokemonRepository);
    tPokemonResource = ApiResource(name: "charmander", url: "test.com");
    tGeneralResource = ApiResource(name: "name", url: "url");
    tPokemon = Pokemon(
        id: 1,
        name: "Chikorita",
        height: 15,
        weight: 15,
        abilities: [
          PokemonAbilityResource(
              is_hidden: true, slot: 2, ability: tGeneralResource)
        ],
        species: tGeneralResource,
        stats: [PokemonStat(stat: tGeneralResource, effort: 0, base_stat: 0)],
        types: [PokemonType(slot: 1, type: tGeneralResource)],
        sprite: 'spriteUrl');

    when(mockPokemonRepository.getPokemon(tPokemonResource))
        .thenAnswer((_) async => right(tPokemon));
  });

  test(
      "Given a Pokemon in form of Api Resource when getPokemon is called from Porkemon Repository Then return a pokemon object",
      () async {
    // Act: Call all the methods that are going to be tested
    final result =
        await usecase(GetPokemonParams(pokemonResource: tPokemonResource));

    // Assert: Check results and values
    // Check that useCase only return what was returned form the repository
    expect(result, right(tPokemon));
    // Verify thath getPokemon from the repository was call
    verify(mockPokemonRepository.getPokemon(tPokemonResource));
    // Only the above method must be called
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
