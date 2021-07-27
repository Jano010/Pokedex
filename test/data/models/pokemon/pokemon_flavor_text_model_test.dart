import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_flavor_text_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_flavor_text.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tGeneralApiResource;
  late PokemonFlavortextModel tPokemonFlavorTextModel;

  setUp(() {
    tGeneralApiResource = ApiResourceModel(name: "name", url: "url");
    tPokemonFlavorTextModel = PokemonFlavortextModel(
        flavor_text: "Flavor Text",
        language: tGeneralApiResource,
        version: tGeneralApiResource);
  });

  group("Flavor Text Json: ", () {
    test("Given a Json strign Then return a Flavor text model object", () {
      final jsonString = fixture("flavor_text.json");

      final result = PokemonFlavortextModel.fromJson(jsonString);

      expect(result, tPokemonFlavorTextModel);
    });

    test(
        "Given a PokemonFlavorTextModel Then it must be of PokemonFlavorText type",
        () {
      expect(tPokemonFlavorTextModel, isA<PokemonFlavorText>());
    });
  });
}
