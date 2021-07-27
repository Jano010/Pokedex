import 'package:equatable/equatable.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:fpdart/src/either.dart';
import 'package:pokedex/core/usecases/usecase.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonAbility
    extends UseCase<PokemonAbility, GetPokemonAbilityParams> {
  GetPokemonAbility(this.pokemonRepository);

  final PokemonRepository pokemonRepository;

  @override
  Future<Either<Failure, PokemonAbility>> call(
          GetPokemonAbilityParams params) async =>
      await pokemonRepository.getPokemonAbility(params.abilityResource);
}

class GetPokemonAbilityParams extends Equatable {
  GetPokemonAbilityParams({required this.abilityResource});

  final ApiResource abilityResource;

  @override
  List<Object?> get props => [abilityResource];
}
