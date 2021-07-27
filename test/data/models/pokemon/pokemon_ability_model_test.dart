import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_ability_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_verbose_effect_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tApiResource;
  late PokemonVerboseEffectModel tPokemonverbose;
  late PokemonAbilityModel tPokemonAbility;

  setUp(() {
    tApiResource = ApiResourceModel(name: "name", url: "url");
    tPokemonverbose = PokemonVerboseEffectModel(
        effect: "effect", short_effect: "short_effect", language: tApiResource);
    tPokemonAbility = PokemonAbilityModel(
        id: 1,
        name: "name",
        effect_entries: [tPokemonverbose, tPokemonverbose]);
  });

  group("Json: ", () {
    test("Given a Json then resturn a PokemonAbilityModel", () {
      // Arrange
      final jsonString = fixture("pokemon_ability.json");

      // Act
      final result = PokemonAbilityModel.fromJson(jsonString);

      // Assert
      expect(result, tPokemonAbility);
    });

    test("given a PokemonAbilityModel then it must be of PokemonAbility type",
        () {
      // Assert
      expect(tPokemonAbility, isA<PokemonAbility>());
    });
  });
}
