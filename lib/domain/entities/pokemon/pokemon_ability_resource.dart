import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';

class PokemonAbilityResource extends Equatable {
  // ignore: non_constant_identifier_names
  final bool is_hidden;
  final int slot;
  final ApiResource ability;

  PokemonAbilityResource({
    // ignore: non_constant_identifier_names
    required this.is_hidden,
    required this.slot,
    required this.ability,
  });

  @override
  List<Object?> get props => [is_hidden, slot, ability];
}
