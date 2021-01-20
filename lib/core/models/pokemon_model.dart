// import 'package:pokedex/core/models/base_list_model.dart';
// import 'dart:convert';

// class PokemonModel {
//   final int id;
//   final String name;
//   final int height;
//   final int weight;
//   final List<PokemonAbility> abilities;
//   final List<PokemonHeldItems> heldItems;
//   final String locationAreaEncounters;
//   final List<PokemonMove> moves;
//   final PokemonSprites sprites;
//   final BaseApiListItem species;
//   final PokemonStat stats;
//   final PokemonType types;

//   PokemonModel(
//       {this.id,
//       this.name,
//       this.height,
//       this.weight,
//       this.abilities,
//       this.heldItems,
//       this.locationAreaEncounters,
//       this.moves,
//       this.sprites,
//       this.species,
//       this.stats,
//       this.types});

//   factory PokemonModel.fromRawJson(String str) =>
//       PokemonModel.fromJson(json.decode(str));

//   factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
//         id: json['id'],
//         name: json['name'],
//         height: json['height'],
//         weight: json['weight'],
//         abilities: List<PokemonAbility>.from(json['abilities'].map()),
//       );
// }

// class PokemonAbility {
//   final bool isHidden;
//   final int slots;
//   final BaseApiListItem ability;
// }

// class PokemonHeldItems {
//   final BaseApiListItem item;
//   final List<PokemonHeldItemVersion> versionDetails;
// }

// class PokemonHeldItemVersion {
//   final BaseApiListItem version;
//   final int rarity;
// }

// class PokemonMove {
//   final BaseApiListItem move;
//   final PokemonMoveVersion versionGroupDetails;
// }

// class PokemonMoveVersion {
//   final BaseApiListItem moveLearnMethod;
//   final BaseApiListItem versionGroup;
//   final int levelLearnedAT;
// }

// class PokemonSprites {
//   final String frontDefault;
//   final String frontShiny;
//   final String frontFemale;
//   final String frontShinyFemale;
//   final String backDefault;
//   final String backShiny;
//   final String backFemale;
//   final String backShinyFemale;
// }

// class PokemonStat {
//   final BaseApiListItem stat;
//   final int effort;
//   final int baseStat;

//   PokemonStat({this.stat, this.effort, this.baseStat});

//   factory PokemonStat.fromJson(Map<String, dynamic> json) => PokemonStat(
//         stat: BaseApiListItem.fromJson(json['stat']),
//         effort: json['effort'],
//         baseStat: json['base_stat'],
//       );
// }

// class PokemonType {
//   final int slot;
//   final BaseApiListItem type;

//   PokemonType({this.slot, this.type});

//   factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
//       slot: json['slot'], type: BaseApiListItem.fromJson(json['type']));
// }
