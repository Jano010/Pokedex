import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_ability_resource_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability_resource.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tGeneralApiResource;
  late PokemonAbilityResourceModel tPokemonAbility;

  setUp(() {
    tGeneralApiResource = ApiResourceModel(name: "name", url: "url");
    tPokemonAbility = PokemonAbilityResourceModel(
        is_hidden: false, slot: 1, ability: tGeneralApiResource);
  });

  group("Json: ", () {
    test("Given a Json return a PokemonAbilityModel", () {
      final jsonString = fixture("pokemon_ability_resource.json");

      final result = PokemonAbilityResourceModel.fromJson(jsonString);

      expect(result, tPokemonAbility);
    });

    test("given a PokemonAbilityModel then it must be a pokemon ability object",
        () {
      expect(tPokemonAbility, isA<PokemonAbilityResource>());
    });
  });
}
