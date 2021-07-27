import 'dart:convert';

import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_ability_resource.dart';

class PokemonAbilityResourceModel extends PokemonAbilityResource {
  // ignore: non_constant_identifier_names
  final bool is_hidden;
  final int slot;
  final ApiResourceModel ability;
  PokemonAbilityResourceModel({
    // ignore: non_constant_identifier_names
    required this.is_hidden,
    required this.slot,
    required this.ability,
  }) : super(is_hidden: is_hidden, slot: slot, ability: ability);

  PokemonAbilityResourceModel copyWith({
    // ignore: non_constant_identifier_names
    bool? is_hidden,
    int? slots,
    ApiResourceModel? ability,
  }) {
    return PokemonAbilityResourceModel(
      is_hidden: is_hidden ?? this.is_hidden,
      slot: slots ?? this.slot,
      ability: ability ?? this.ability,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_hidden': is_hidden,
      'slot': slot,
      'ability': ability.toMap(),
    };
  }

  factory PokemonAbilityResourceModel.fromMap(Map<String, dynamic> map) {
    return PokemonAbilityResourceModel(
      is_hidden: map['is_hidden'],
      slot: map['slot'],
      ability: ApiResourceModel.fromMap(map['ability']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonAbilityResourceModel.fromJson(String source) =>
      PokemonAbilityResourceModel.fromMap(json.decode(source));
}
