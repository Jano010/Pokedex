import 'dart:convert';

import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_stat.dart';

class PokemonStatModel extends PokemonStat {
  final ApiResourceModel stat;
  final int effort;
  // ignore: non_constant_identifier_names
  final int base_stat;
  PokemonStatModel({
    required this.stat,
    required this.effort,
    // ignore: non_constant_identifier_names
    required this.base_stat,
  }) : super(effort: effort, stat: stat, base_stat: base_stat);

  PokemonStatModel copyWith({
    ApiResourceModel? stat,
    int? effort,
    // ignore: non_constant_identifier_names
    int? base_stat,
  }) {
    return PokemonStatModel(
      stat: stat ?? this.stat,
      effort: effort ?? this.effort,
      base_stat: base_stat ?? this.base_stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stat': stat.toMap(),
      'effort': effort,
      'base_stat': base_stat,
    };
  }

  factory PokemonStatModel.fromMap(Map<String, dynamic> map) {
    return PokemonStatModel(
      stat: ApiResourceModel.fromMap(map['stat']),
      effort: map['effort'],
      base_stat: map['base_stat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonStatModel.fromJson(String source) =>
      PokemonStatModel.fromMap(json.decode(source));
}
