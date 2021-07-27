import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_stat.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_type.dart';
import 'package:pokedex/domain/usecases/search_pokemon.dart';

import 'get_pokemon_test.mocks.dart';

void main() {
  late SearchPokemon usecase;
  late MockPokemonRepository mockPokemonRepository;
  late ApiResource tGeneralApiResource;
  late Pokemon tPokemon;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = SearchPokemon(mockPokemonRepository);
    tGeneralApiResource = ApiResource(name: "name", url: "url");
    tPokemon = Pokemon(
        id: 1,
        name: "Chikorita",
        height: 15,
        weight: 15,
        abilities: [
          PokemonAbilityResource(
              is_hidden: true, slot: 1, ability: tGeneralApiResource)
        ],
        species: tGeneralApiResource,
        stats: [
          PokemonStat(stat: tGeneralApiResource, effort: 0, base_stat: 0)
        ],
        types: [PokemonType(slot: 1, type: tGeneralApiResource)],
        sprite: 'spriteUrl');

    when(mockPokemonRepository.searchPokemon(1, any))
        .thenAnswer((_) async => right(tPokemon));
  });

  test(
      "given an Id or a name When searching for a pokemon Then return a Pokemon object",
      () async {
    final result = await usecase(SearchPokemonParams(id: 1));

    expect(result, right(tPokemon));
    verify(mockPokemonRepository.searchPokemon(1, any));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
