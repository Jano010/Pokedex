import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_type_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_type.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tApiResource;
  late PokemonTypeModel tPokemonTypeModel;

  setUp(() {
    tApiResource = ApiResourceModel(name: "name", url: "url");
    tPokemonTypeModel = PokemonTypeModel(slot: 1, type: tApiResource);
  });

  group("Json: ", () {
    test("Given a Json return PokemonType model", () {
      final jsonString = fixture("pokemon_type.json");

      final result = PokemonTypeModel.fromJson(jsonString);

      expect(result, tPokemonTypeModel);
    });

    test('Given a PokemonTypeModel Then it must be of PokemonType type',
        () async {
      expect(tPokemonTypeModel, isA<PokemonType>());
    });
  });
}
