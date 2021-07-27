import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/domain/entities/api/api_pagination.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemon_list.dart';
import 'get_pokemon_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonList getPokemonList;
  late PokemonRepository mockPokemonRepository;
  late ApiPagination tApiPagination;
  late ApiResource tApiResource;

  setUp(() {
    // Arrange
    mockPokemonRepository = MockPokemonRepository();
    getPokemonList = GetPokemonList(mockPokemonRepository);
    tApiResource = ApiResource(name: "name", url: "url");
    tApiPagination = ApiPagination(
        count: 2, next: "next", previous: "back", results: [tApiResource]);

    when(mockPokemonRepository.getPokemonList("url"))
        .thenAnswer((_) async => right(tApiPagination));
  });

  test('Given a call of getPokemonList Then return an ApiResourceList object',
      () async {
    // Act
    final result = await getPokemonList(PokemonListParams(url: "url"));

    // Assert
    expect(result, right(tApiPagination));
    verify(mockPokemonRepository.getPokemonList("url"));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
