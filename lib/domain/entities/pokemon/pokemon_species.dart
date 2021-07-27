import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_flavor_text.dart';

class PokemonSpecies extends Equatable {
  // ignore: non_constant_identifier_names
  final int gender_rate;
  // ignore: non_constant_identifier_names
  final int capture_rate;
  // ignore: non_constant_identifier_names
  final ApiResource growth_rate;
  // ignore: non_constant_identifier_names
  final int hatch_counter;
  // ignore: non_constant_identifier_names
  final List<ApiResource> egg_groups;
  // ignore: non_constant_identifier_names
  final List<PokemonFlavorText> flavor_text_entries;

  PokemonSpecies(
      // ignore: non_constant_identifier_names
      {required this.gender_rate,
      // ignore: non_constant_identifier_names
      required this.capture_rate,
      // ignore: non_constant_identifier_names
      required this.growth_rate,
      // ignore: non_constant_identifier_names
      required this.hatch_counter,
      // ignore: non_constant_identifier_names
      required this.egg_groups,
      // ignore: non_constant_identifier_names
      required this.flavor_text_entries});

  @override
  List<Object?> get props => [
        gender_rate,
        capture_rate,
        growth_rate,
        hatch_counter,
        egg_groups,
        flavor_text_entries
      ];
}
