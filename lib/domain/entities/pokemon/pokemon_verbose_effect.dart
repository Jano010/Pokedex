import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pokedex/domain/entities/api/api_resource.dart';

class PokemonVerboseEffect extends Equatable {
  final String effect;
  // ignore: non_constant_identifier_names
  final String short_effect;
  final ApiResource language;

  PokemonVerboseEffect({
    required this.effect,
    // ignore: non_constant_identifier_names
    required this.short_effect,
    required this.language,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [effect, short_effect, language];
}
