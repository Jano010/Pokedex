import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_ability_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_stat_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_type_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late PokemonModel tPokemonModel;
  late PokemonAbilityResourceModel tPokemonAbility;
  late PokemonStatModel tPokemonStatModel;
  late PokemonTypeModel tPokemonTypeModel;
  late ApiResourceModel tGeneralApiResource;

  setUp(() {
    tGeneralApiResource = ApiResourceModel(name: "name", url: "url");
    tPokemonAbility = PokemonAbilityResourceModel(
        is_hidden: false, slot: 1, ability: tGeneralApiResource);
    tPokemonStatModel =
        PokemonStatModel(stat: tGeneralApiResource, effort: 1, base_stat: 1);
    tPokemonTypeModel = PokemonTypeModel(slot: 1, type: tGeneralApiResource);
    tPokemonModel = PokemonModel(
        id: 1,
        name: "name",
        height: 1,
        weight: 1,
        abilities: [tPokemonAbility, tPokemonAbility],
        sprite:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
        species: tGeneralApiResource,
        stats: [tPokemonStatModel, tPokemonStatModel],
        types: [tPokemonTypeModel, tPokemonTypeModel]);
  });

  group("Pokemon Model Json: ", () {
    test("Given a Json Then return a Pokemon model ", () {
      final jsonString = fixture("pokemon_response.json");

      final result = PokemonModel.fromJson(jsonString);

      expect(result, tPokemonModel);
    });

    test("Given a PokemonModel Then it must be of Pokemon type", () {
      expect(tPokemonModel, isA<Pokemon>());
    });
  });
}
