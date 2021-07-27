import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';

class PokemonPageArguments {
  PokemonPageArguments({required this.pokemon, required this.pokemonSpecies});

  final Pokemon pokemon;
  final PokemonSpecies pokemonSpecies;
}
