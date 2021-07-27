import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/domain/entities/api/api_pagination.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemon(ApiResource pokemon);
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies(
      ApiResource species);
  Future<Either<Failure, Pokemon>> searchPokemon(int? id, String? name);
  Future<Either<Failure, ApiPagination>> getPokemonList(String? url);
  Future<Either<Failure, PokemonAbility>> getPokemonAbility(
      ApiResource ability);
}
