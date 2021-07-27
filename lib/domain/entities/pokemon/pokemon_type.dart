import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';

class PokemonType extends Equatable {
  final int slot;
  final ApiResource type;

  PokemonType({required this.slot, required this.type});

  @override
  List<Object?> get props => [slot, type];
}
