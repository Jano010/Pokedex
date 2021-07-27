import 'package:pokedex/core/errors/exceptions.dart';
import 'package:pokedex/core/utils/network_info.dart';
import 'package:pokedex/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/api/api_pagination.dart';
import 'package:pokedex/core/errors/failures.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  final NetworkInfo networkInfo;
  final PokemonRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Pokemon>> getPokemon(ApiResource pokemon) async {
    if (await networkInfo.isConnected) {
      try {
        final Pokemon newPokemon = await remoteDataSource.getPokemon(pokemon);
        return right(newPokemon);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ApiPagination>> getPokemonList(String? url) async {
    if (await networkInfo.isConnected) {
      try {
        final page = await remoteDataSource.getPokemonList(url);
        return right(page);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies(
      ApiResource species) async {
    if (await networkInfo.isConnected) {
      try {
        final pokemonSpecies =
            await remoteDataSource.getPokemonSpeceies(species);
        return right(pokemonSpecies);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> searchPokemon(int? id, String? name) async {
    if (await networkInfo.isConnected) {
      try {
        final pokemon = await remoteDataSource.searchPokemon(id, name);
        return right(pokemon);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonAbility>> getPokemonAbility(
      ApiResource ability) async {
    if (await networkInfo.isConnected) {
      try {
        final abilityResult = await remoteDataSource.getPokemonAbility(ability);
        return right(abilityResult);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(ConnectionFailure());
    }
  }
}
