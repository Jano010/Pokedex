import 'dart:convert';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_flavor_text.dart';

class PokemonFlavortextModel extends PokemonFlavorText {
  // ignore: non_constant_identifier_names
  final String flavor_text;
  final ApiResourceModel language;
  final ApiResourceModel version;

  PokemonFlavortextModel({
    // ignore: non_constant_identifier_names
    required this.flavor_text,
    required this.language,
    required this.version,
  }) : super(flavor_text: flavor_text, language: language, version: version);

  PokemonFlavortextModel copyWith({
    // ignore: non_constant_identifier_names
    String? flavor_text,
    ApiResourceModel? language,
    ApiResourceModel? version,
  }) {
    return PokemonFlavortextModel(
      flavor_text: flavor_text ?? this.flavor_text,
      language: language ?? this.language,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flavor_text': flavor_text,
      'language': language.toMap(),
      'version': version.toMap(),
    };
  }

  factory PokemonFlavortextModel.fromMap(Map<String, dynamic> map) {
    return PokemonFlavortextModel(
      flavor_text: map['flavor_text'],
      language: ApiResourceModel.fromMap(map['language']),
      version: ApiResourceModel.fromMap(map['version']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonFlavortextModel.fromJson(String source) =>
      PokemonFlavortextModel.fromMap(json.decode(source));
}
