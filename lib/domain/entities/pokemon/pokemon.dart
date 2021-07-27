import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_stat.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_type.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonAbilityResource> abilities;
  final String sprite;
  final ApiResource species;
  final List<PokemonStat> stats;
  final List<PokemonType> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.sprite,
    required this.species,
    required this.stats,
    required this.types,
  });

  @override
  List<Object?> get props =>
      [id, name, height, weight, abilities, sprite, species, stats, types];
}
