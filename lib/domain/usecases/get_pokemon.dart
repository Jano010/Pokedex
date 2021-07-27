import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/core/usecases/usecase.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemon extends UseCase<Pokemon, GetPokemonParams> {
  GetPokemon(this.pokemonRepository);

  final PokemonRepository pokemonRepository;

  @override
  Future<Either<Failure, Pokemon>> call(GetPokemonParams params) async {
    return await pokemonRepository.getPokemon(params.pokemonResource);
  }
}

class GetPokemonParams extends Equatable {
  GetPokemonParams({required this.pokemonResource});

  final ApiResource pokemonResource;

  @override
  List<Object?> get props => [pokemonResource];
}
