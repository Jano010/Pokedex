import 'dart:convert';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/data/models/pokemon/pokemon_flavor_text_model.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';

class PokemonSpeciesModel extends PokemonSpecies {
  // ignore: non_constant_identifier_names
  final int gender_rate;
  // ignore: non_constant_identifier_names
  final int capture_rate;
  // ignore: non_constant_identifier_names
  final ApiResourceModel growth_rate;
  // ignore: non_constant_identifier_names
  final int hatch_counter;
  // ignore: non_constant_identifier_names
  final List<ApiResourceModel> egg_groups;
  // ignore: non_constant_identifier_names
  final List<PokemonFlavortextModel> flavor_text_entries;

  PokemonSpeciesModel({
    // ignore: non_constant_identifier_names
    required this.gender_rate,
    // ignore: non_constant_identifier_names
    required this.capture_rate,
    // ignore: non_constant_identifier_names
    required this.growth_rate,
    // ignore: non_constant_identifier_names
    required this.hatch_counter,
    // ignore: non_constant_identifier_names
    required this.egg_groups,
    // ignore: non_constant_identifier_names
    required this.flavor_text_entries,
  }) : super(
            gender_rate: gender_rate,
            capture_rate: capture_rate,
            growth_rate: growth_rate,
            hatch_counter: hatch_counter,
            egg_groups: egg_groups,
            flavor_text_entries: flavor_text_entries);

  PokemonSpeciesModel copyWith({
    // ignore: non_constant_identifier_names
    int? gender_rate,
    // ignore: non_constant_identifier_names
    int? capture_rate,
    // ignore: non_constant_identifier_names
    ApiResourceModel? growth_rate,
    // ignore: non_constant_identifier_names
    int? hatch_counter,
    // ignore: non_constant_identifier_names
    List<ApiResourceModel>? egg_groups,
    // ignore: non_constant_identifier_names
    List<PokemonFlavortextModel>? flavor_text_entries,
  }) {
    return PokemonSpeciesModel(
      gender_rate: gender_rate ?? this.gender_rate,
      capture_rate: capture_rate ?? this.capture_rate,
      growth_rate: growth_rate ?? this.growth_rate,
      hatch_counter: hatch_counter ?? this.hatch_counter,
      egg_groups: egg_groups ?? this.egg_groups,
      flavor_text_entries: flavor_text_entries ?? this.flavor_text_entries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender_rate': gender_rate,
      'capture_rate': capture_rate,
      'growth_rate': growth_rate.toMap(),
      'hatch_counter': hatch_counter,
      'egg_groups': egg_groups.map((x) => x.toMap()).toList(),
      'flavor_text_entries': flavor_text_entries.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonSpeciesModel.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesModel(
      gender_rate: map['gender_rate'],
      capture_rate: map['capture_rate'],
      growth_rate: ApiResourceModel.fromMap(map['growth_rate']),
      hatch_counter: map['hatch_counter'],
      egg_groups: List<ApiResourceModel>.from(
          map['egg_groups']?.map((x) => ApiResourceModel.fromMap(x))),
      flavor_text_entries: List<PokemonFlavortextModel>.from(
          map['flavor_text_entries']
              ?.map((x) => PokemonFlavortextModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpeciesModel.fromJson(String source) =>
      PokemonSpeciesModel.fromMap(json.decode(source));
}
