import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex/data/models/pokemon/pokemon_verbose_effect_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability.dart';

class PokemonAbilityModel extends PokemonAbility {
  final int id;
  final String name;
  // ignore: non_constant_identifier_names
  final List<PokemonVerboseEffectModel> effect_entries;
  PokemonAbilityModel({
    required this.id,
    required this.name,

    // ignore: non_constant_identifier_names
    required this.effect_entries,
  }) : super(id: id, name: name, effect_entries: effect_entries);

  PokemonAbilityModel copyWith({
    int? id,
    String? name,

    // ignore: non_constant_identifier_names
    List<PokemonVerboseEffectModel>? effect_entries,
  }) {
    return PokemonAbilityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      effect_entries: effect_entries ?? this.effect_entries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'effect_entries': effect_entries.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonAbilityModel.fromMap(Map<String, dynamic> map) {
    return PokemonAbilityModel(
      id: map['id'],
      name: map['name'],
      effect_entries: List<PokemonVerboseEffectModel>.from(map['effect_entries']
          ?.map((x) => PokemonVerboseEffectModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonAbilityModel.fromJson(String source) =>
      PokemonAbilityModel.fromMap(json.decode(source));
}
