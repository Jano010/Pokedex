import 'dart:convert';

import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_ability_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_stat_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_type_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';

class PokemonModel extends Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonAbilityResourceModel> abilities;
  final String sprite;
  final ApiResourceModel species;
  final List<PokemonStatModel> stats;
  final List<PokemonTypeModel> types;

  PokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.sprite,
    required this.species,
    required this.stats,
    required this.types,
  }) : super(
            id: id,
            name: name,
            height: height,
            weight: weight,
            abilities: abilities,
            sprite: sprite,
            species: species,
            stats: stats,
            types: types);

  PokemonModel copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<PokemonAbilityResourceModel>? abilities,
    String? sprite,
    ApiResourceModel? species,
    List<PokemonStatModel>? stats,
    List<PokemonTypeModel>? types,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      abilities: abilities ?? this.abilities,
      sprite: sprite ?? this.sprite,
      species: species ?? this.species,
      stats: stats ?? this.stats,
      types: types ?? this.types,
    );
  }

  String _spriteUrl(int id) =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'height': height,
      'weight': weight,
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'sprite': sprite,
      'species': species.toMap(),
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'],
      name: map['name'],
      height: map['height'],
      weight: map['weight'],
      abilities: List<PokemonAbilityResourceModel>.from(
          map['abilities']?.map((x) => PokemonAbilityResourceModel.fromMap(x))),
      sprite:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${map['id']}.png",
      species: ApiResourceModel.fromMap(map['species']),
      stats: List<PokemonStatModel>.from(
          map['stats']?.map((x) => PokemonStatModel.fromMap(x))),
      types: List<PokemonTypeModel>.from(
          map['types']?.map((x) => PokemonTypeModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
