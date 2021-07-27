import 'dart:convert';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_type.dart';

class PokemonTypeModel extends PokemonType {
  final int slot;
  final ApiResourceModel type;

  PokemonTypeModel({
    required this.slot,
    required this.type,
  }) : super(slot: slot, type: type);

  PokemonTypeModel copyWith({
    int? slot,
    ApiResourceModel? type,
  }) {
    return PokemonTypeModel(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type.toMap(),
    };
  }

  factory PokemonTypeModel.fromMap(Map<String, dynamic> map) {
    return PokemonTypeModel(
      slot: map['slot'],
      type: ApiResourceModel.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonTypeModel.fromJson(String source) =>
      PokemonTypeModel.fromMap(json.decode(source));
}
