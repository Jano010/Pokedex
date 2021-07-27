import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_verbose_effect.dart';
import 'package:pokedex/domain/usecases/get_pokemon_ability.dart';

import 'get_pokemon_test.mocks.dart';

void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetPokemonAbility usecase;
  late ApiResource tApiResource;
  late PokemonVerboseEffect tEffectEntries;
  late PokemonAbility tPokemonAbility;

  // Arrange
  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonAbility(mockPokemonRepository);
    tApiResource = ApiResource(name: "name", url: "url");
    tEffectEntries = PokemonVerboseEffect(
        effect: "effect", short_effect: "short_effect", language: tApiResource);
    tPokemonAbility =
        PokemonAbility(id: 1, name: "name", effect_entries: tEffectEntries);

    when(mockPokemonRepository.getPokemonAbility(tApiResource))
        .thenAnswer((realInvocation) async => right(tPokemonAbility));
  });

  test("When GEtPokemonAbility is call then return a PokemonAbilityObject",
      () async {
    // Act
    final result =
        await usecase(GetPokemonAbilityParams(abilityResource: tApiResource));

    // Assert
    expect(result, right(tPokemonAbility));
    verify(mockPokemonRepository.getPokemonAbility(tApiResource));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
