import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/features/general/api_resource.dart';

part 'pokemon_type.g.dart';
part 'pokemon_type.freezed.dart';

@freezed
abstract class PokemonType with _$PokemonType {
  const factory PokemonType({required int slot, required ApiResource type}) =
      _PokemonType;
  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}
