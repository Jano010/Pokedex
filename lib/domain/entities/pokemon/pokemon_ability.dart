import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_verbose_effect.dart';

class PokemonAbility extends Equatable {
  final int id;
  final String name;
  // ignore: non_constant_identifier_names
  final List<PokemonVerboseEffect> effect_entries;
  PokemonAbility({
    required this.id,
    required this.name,
    // ignore: non_constant_identifier_names
    required this.effect_entries,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, effect_entries];
}
