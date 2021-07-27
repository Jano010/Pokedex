import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';

class PokemonFlavorText extends Equatable {
  // ignore: non_constant_identifier_names
  final String flavor_text;
  final ApiResource language;
  final ApiResource version;

  PokemonFlavorText(
      // ignore: non_constant_identifier_names
      {required this.flavor_text,
      required this.language,
      required this.version});

  @override
  List<Object?> get props => [flavor_text, language, version];
}
