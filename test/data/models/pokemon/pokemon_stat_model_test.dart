import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_stat_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_stat.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late PokemonStatModel tPokemonStatModel;
  late ApiResourceModel tApiResourceModel;

  setUp(() {
    tApiResourceModel = ApiResourceModel(name: "name", url: "url");
    tPokemonStatModel =
        PokemonStatModel(stat: tApiResourceModel, effort: 1, base_stat: 1);
  });

  group("Json: ", () {
    test("Given a json Then return a Pokemon Stat Model", () {
      final jsonString = fixture("pokemon_stat.json");

      final result = PokemonStatModel.fromJson(jsonString);

      expect(result, tPokemonStatModel);
    });

    test("Given a PokemonStatModel Then it must be of type PokemonStat", () {
      expect(tPokemonStatModel, isA<PokemonStat>());
    });
  });
}
