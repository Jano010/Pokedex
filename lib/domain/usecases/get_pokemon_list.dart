import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:fpdart/src/either.dart';
import 'package:pokedex/core/usecases/usecase.dart';
import 'package:pokedex/domain/entities/api/api_pagination.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonList extends UseCase<ApiPagination, PokemonListParams> {
  GetPokemonList(this.pokemonRepository);

  final PokemonRepository pokemonRepository;

  @override
  Future<Either<Failure, ApiPagination>> call(PokemonListParams params) {
    return pokemonRepository.getPokemonList(params.url);
  }
}

class PokemonListParams extends Equatable {
  PokemonListParams({required this.url});

  final String? url;

  @override
  List<Object?> get props => [];
}
