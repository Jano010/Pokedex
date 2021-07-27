import 'package:equatable/equatable.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:fpdart/src/either.dart';
import 'package:pokedex/core/usecases/usecase.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class SearchPokemon extends UseCase<Pokemon, SearchPokemonParams> {
  SearchPokemon(this.pokemonRepository);

  final PokemonRepository pokemonRepository;

  @override
  Future<Either<Failure, Pokemon>> call(SearchPokemonParams params) =>
      pokemonRepository.searchPokemon(params.id, params.name);
}

class SearchPokemonParams extends Equatable {
  SearchPokemonParams({this.id, this.name});

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
