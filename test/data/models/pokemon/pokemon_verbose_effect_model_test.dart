import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_verbose_effect_model.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_verbose_effect.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tApiResource;
  late PokemonVerboseEffectModel tPokemonVerboseEffect;

  setUp(() {
    // Arrange
    tApiResource = ApiResourceModel(name: "name", url: "url");
    tPokemonVerboseEffect = PokemonVerboseEffectModel(
        effect: "effect", short_effect: "short_effect", language: tApiResource);
  });

  group("Json: ", () {
    test("Given a Json return a PokemonVerboseEffectModel", () {
      // Arrange
      final jsonString = fixture("pokemon_verbose_effect.json");

      // Act
      final result = PokemonVerboseEffectModel.fromJson(jsonString);

      // Assert
      expect(result, tPokemonVerboseEffect);
    });

    test(
        "Given a PokemonVerboseEffectModel then it must be of type PokemonVerboseEffect",
        () {
      // Assert
      expect(tPokemonVerboseEffect, isA<PokemonVerboseEffect>());
    });
  });
}
