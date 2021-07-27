import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_flavor_text_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_species_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tGeneralApiResource;
  late PokemonSpeciesModel tPokemonSpeciesModel;
  late PokemonFlavortextModel tPokemonFlavorTextModel;

  setUp(() {
    tGeneralApiResource = ApiResourceModel(name: "name", url: "url");
    tPokemonFlavorTextModel = PokemonFlavortextModel(
        flavor_text: "Flavor Text",
        language: tGeneralApiResource,
        version: tGeneralApiResource);
    tPokemonSpeciesModel = PokemonSpeciesModel(
        gender_rate: 1,
        capture_rate: 1,
        growth_rate: tGeneralApiResource,
        hatch_counter: 1,
        egg_groups: [
          tGeneralApiResource,
          tGeneralApiResource
        ],
        flavor_text_entries: [
          tPokemonFlavorTextModel,
          tPokemonFlavorTextModel
        ]);
  });

  group("PokemonSpecies Json: ", () {
    test("Given a Jsonstring Then return a PokemonSpeciesModel", () {
      final jsonString = fixture("pokemon_species.json");

      final result = PokemonSpeciesModel.fromJson(jsonString);

      expect(result, tPokemonSpeciesModel);
    });

    test("Given a PokemonspeciesModel Then must be of PokemoSpecies type", () {
      expect(tPokemonSpeciesModel, isA<PokemonSpecies>());
    });
  });
}
