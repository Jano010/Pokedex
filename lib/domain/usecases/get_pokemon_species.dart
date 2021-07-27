import 'package:equatable/equatable.dart';
import 'package:pokedex/core/errors/failures.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:pokedex/core/usecases/usecase.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonSpecies
    extends UseCase<PokemonSpecies, GetPokemonSpeciesParams> {
  GetPokemonSpecies(this.pokemonRepository);
  final PokemonRepository pokemonRepository;

  @override
  Future<Either<Failure, PokemonSpecies>> call(
          GetPokemonSpeciesParams params) =>
      pokemonRepository.getPokemonSpecies(params.species);
}

class GetPokemonSpeciesParams extends Equatable {
  GetPokemonSpeciesParams({required this.species});

  final ApiResource species;

  @override
  List<Object?> get props => [species];
}
