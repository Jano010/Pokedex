import 'dart:convert';

import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_verbose_effect.dart';

class PokemonVerboseEffectModel extends PokemonVerboseEffect {
  final String effect;
  // ignore: non_constant_identifier_names
  final String short_effect;
  final ApiResourceModel language;
  PokemonVerboseEffectModel({
    required this.effect,
    // ignore: non_constant_identifier_names
    required this.short_effect,
    required this.language,
  }) : super(effect: effect, short_effect: short_effect, language: language);

  PokemonVerboseEffectModel copyWith({
    String? effect,
    // ignore: non_constant_identifier_names
    String? short_effect,
    ApiResourceModel? language,
  }) {
    return PokemonVerboseEffectModel(
      effect: effect ?? this.effect,
      short_effect: short_effect ?? this.short_effect,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'effect': effect,
      'short_effect': short_effect,
      'language': language.toMap(),
    };
  }

  factory PokemonVerboseEffectModel.fromMap(Map<String, dynamic> map) {
    return PokemonVerboseEffectModel(
      effect: map['effect'],
      short_effect: map['short_effect'],
      language: ApiResourceModel.fromMap(map['language']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonVerboseEffectModel.fromJson(String source) =>
      PokemonVerboseEffectModel.fromMap(json.decode(source));
}
