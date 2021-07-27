import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';

class PokemonStat extends Equatable {
  final ApiResource stat;
  final int effort;
  // ignore: non_constant_identifier_names
  final int base_stat;

  PokemonStat(
      {required this.stat,
      required this.effort,
      // ignore: non_constant_identifier_names
      required this.base_stat});

  @override
  List<Object?> get props => [stat, effort, base_stat];
}
