import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_flavor_text_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';
import 'package:pokedex/domain/usecases/get_pokemon_species.dart';

import 'get_pokemon_list_test.mocks.dart';

void main() {
  late GetPokemonSpecies usecase;
  late MockPokemonRepository mockPokemonRepository;
  late ApiResourceModel tPokemonSpeciesResource;
  late ApiResourceModel tGeneralApiResource;
  late PokemonFlavortextModel tFlavorText;
  late PokemonSpecies tPokemonSpecies;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonSpecies(mockPokemonRepository);
    tPokemonSpeciesResource = ApiResourceModel(name: "coco", url: "coco.com");
    tGeneralApiResource = ApiResourceModel(name: "name", url: "url");
    tFlavorText = PokemonFlavortextModel(
        flavor_text: "",
        language: tGeneralApiResource,
        version: tGeneralApiResource);
    tPokemonSpecies = PokemonSpecies(
        gender_rate: 1,
        capture_rate: 1,
        growth_rate: tGeneralApiResource,
        hatch_counter: 2,
        egg_groups: [tGeneralApiResource, tGeneralApiResource],
        flavor_text_entries: [tFlavorText, tFlavorText]);

    when(mockPokemonRepository.getPokemonSpecies(tPokemonSpeciesResource))
        .thenAnswer((_) async => right(tPokemonSpecies));
  });

  test(
      "Give a ApiResource for pokemon Species then return a PokemonSpecies object",
      () async {
    final result = await usecase(
        GetPokemonSpeciesParams(species: tPokemonSpeciesResource));
    expect(result, right(tPokemonSpecies));
    verify(mockPokemonRepository.getPokemonSpecies(tPokemonSpeciesResource));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
