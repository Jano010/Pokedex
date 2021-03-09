import 'dart:convert';
import 'package:pokedex/core/models/resources_models.dart';

class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonAbility> abilities;
  final List<PokemonHeldItems> held_items;
  final String location_area_encounters;
  final List<PokemonMove> moves;
  final PokemonSprites sprites;
  final ApiResource species;
  final List<PokemonStat> stats;
  final List<PokemonType> types;

  Pokemon({
    this.id,
    this.name,
    this.height,
    this.weight,
    this.abilities,
    this.held_items,
    this.location_area_encounters,
    this.moves,
    this.sprites,
    this.species,
    this.stats,
    this.types,
  });

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Pokemon(
      id: map['id'],
      name: map['name'],
      height: map['height'],
      weight: map['weight'],
      abilities: List<PokemonAbility>.from(
          map['abilities']?.map((x) => PokemonAbility.fromMap(x))),
      held_items: List<PokemonHeldItems>.from(
          map['held_items']?.map((x) => PokemonHeldItems.fromMap(x))),
      location_area_encounters: map['location_area_encounters'],
      moves: List<PokemonMove>.from(
          map['moves']?.map((x) => PokemonMove.fromMap(x))),
      sprites: PokemonSprites.fromMap(map['sprites']),
      species: ApiResource.fromMap(map['species']),
      stats: List<PokemonStat>.from(
          map['stats']?.map((x) => PokemonStat.fromMap(x))),
      types: List<PokemonType>.from(
          map['types']?.map((x) => PokemonType.fromMap(x))),
    );
  }

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, height: $height, weight: $weight, abilities: $abilities, held_items: $held_items, location_area_encounters: $location_area_encounters, moves: $moves, sprites: $sprites, species: $species, stats: $stats, types: $types)';
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'height': height,
      'weight': weight,
      'abilities': abilities?.map((x) => x?.toMap())?.toList(),
      'held_items': held_items?.map((x) => x?.toMap())?.toList(),
      'location_area_encounters': location_area_encounters,
      'moves': moves?.map((x) => x?.toMap())?.toList(),
      'sprites': sprites?.toMap(),
      'species': species?.toMap(),
      'stats': stats?.map((x) => x?.toMap())?.toList(),
      'types': types?.map((x) => x?.toMap())?.toList(),
    };
  }
}

class PokemonAbility {
  final bool is_hidden;
  final int slots;
  final ApiResource ability;

  PokemonAbility({
    this.is_hidden,
    this.slots,
    this.ability,
  });

  factory PokemonAbility.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonAbility(
      is_hidden: map['isHidden'],
      slots: map['slots'],
      ability: ApiResource.fromMap(map['ability']),
    );
  }

  factory PokemonAbility.fromJson(String source) =>
      PokemonAbility.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonAbility(isHidden: $is_hidden, slots: $slots, ability: $ability)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'isHidden': is_hidden,
      'slots': slots,
      'ability': ability?.toMap(),
    };
  }
}

class PokemonHeldItems {
  final ApiResource item;
  final List<PokemonHeldItemVersion> version_details;

  PokemonHeldItems({
    this.item,
    this.version_details,
  });

  factory PokemonHeldItems.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonHeldItems(
      item: ApiResource.fromMap(map['item']),
      version_details: List<PokemonHeldItemVersion>.from(map['version_details']
          ?.map((x) => PokemonHeldItemVersion.fromMap(x))),
    );
  }

  factory PokemonHeldItems.fromJson(String source) =>
      PokemonHeldItems.fromMap(json.decode(source));

  @override
  String toString() =>
      'Pokemonheld_items(item: $item, versionDetails: $version_details)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'item': item?.toMap(),
      'versionDetails': version_details?.map((x) => x?.toMap())?.toList(),
    };
  }
}

class PokemonHeldItemVersion {
  final ApiResource version;
  final int rarity;

  PokemonHeldItemVersion({
    this.version,
    this.rarity,
  });

  factory PokemonHeldItemVersion.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonHeldItemVersion(
      version: ApiResource.fromMap(map['version']),
      rarity: map['rarity'],
    );
  }

  factory PokemonHeldItemVersion.fromJson(String source) =>
      PokemonHeldItemVersion.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonHeldItemVersion(version: $version, rarity: $rarity)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'version': version?.toMap(),
      'rarity': rarity,
    };
  }
}

class PokemonMove {
  final ApiResource move;
  final List<PokemonMoveVersion> version_group_details;

  PokemonMove({
    this.move,
    this.version_group_details,
  });

  factory PokemonMove.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonMove(
        move: ApiResource.fromMap(map['move']),
        version_group_details: List<PokemonMoveVersion>.from(
            map['version_group_details']
                ?.map((x) => PokemonMoveVersion.fromMap(x))));
  }

  factory PokemonMove.fromJson(String source) =>
      PokemonMove.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonMove(move: $move, versionGroupDetails: $version_group_details)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'move': move?.toMap(),
      'versionGroupDetails':
          version_group_details?.map((x) => x?.toMap())?.toList(),
    };
  }
}

class PokemonMoveVersion {
  final ApiResource move_learn_method;
  final ApiResource version_group;
  final int level_learned_at;

  PokemonMoveVersion({
    this.move_learn_method,
    this.version_group,
    this.level_learned_at,
  });

  factory PokemonMoveVersion.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonMoveVersion(
      move_learn_method: ApiResource.fromMap(map['move_learn_method']),
      version_group: ApiResource.fromMap(map['version_group']),
      level_learned_at: map['level_learned_at'],
    );
  }

  factory PokemonMoveVersion.fromJson(String source) =>
      PokemonMoveVersion.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonMoveVersion(moveLearnMethod: $move_learn_method, versionGroup: $version_group, levelLearnedAT: $level_learned_at)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'moveLearnMethod': move_learn_method?.toMap(),
      'versionGroup': version_group?.toMap(),
      'levelLearnedAT': level_learned_at,
    };
  }
}

class PokemonSprites {
  final String front_default;
  final String front_shiny;
  final String front_female;
  final String front_shiny_female;
  final String back_default;
  final String back_shiny;
  final String back_female;
  final String back_shiny_female;

  PokemonSprites({
    this.front_default,
    this.front_shiny,
    this.front_female,
    this.front_shiny_female,
    this.back_default,
    this.back_shiny,
    this.back_female,
    this.back_shiny_female,
  });

  factory PokemonSprites.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonSprites(
      front_default: map['front_default'],
      front_shiny: map['front_shiny'],
      front_female: map['front_female'],
      front_shiny_female: map['front_shiny_female'],
      back_default: map['back_default'],
      back_shiny: map['back_shiny'],
      back_female: map['back_female'],
      back_shiny_female: map['back_shiny_female'],
    );
  }

  factory PokemonSprites.fromJson(String source) =>
      PokemonSprites.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonSprites(frontDefault: $front_default, frontShiny: $front_shiny, frontFemale: $front_female, frontShinyFemale: $front_shiny_female, backDefault: $back_default, backShiny: $back_shiny, backFemale: $back_female, backShinyFemale: $back_shiny_female)';
  }

  Map<String, dynamic> toMap() {
    return {
      'frontDefault': front_default,
      'frontShiny': front_shiny,
      'frontFemale': front_female,
      'frontShinyFemale': front_shiny_female,
      'backDefault': back_default,
      'backShiny': back_shiny,
      'backFemale': back_female,
      'backShinyFemale': back_shiny_female,
    };
  }

  String toJson() => json.encode(toMap());
}

class PokemonStat {
  final ApiResource stat;
  final int effort;
  final int base_stat;
  PokemonStat({
    this.stat,
    this.effort,
    this.base_stat,
  });

  factory PokemonStat.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonStat(
      stat: ApiResource.fromMap(map['stat']),
      effort: map['effort'],
      base_stat: map['base_stat'],
    );
  }

  factory PokemonStat.fromJson(String source) =>
      PokemonStat.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonStat(stat: $stat, effort: $effort, base_stat: $base_stat)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'stat': stat?.toMap(),
      'effort': effort,
      'base_stat': base_stat,
    };
  }
}

class PokemonType {
  final int slot;
  final ApiResource type;

  PokemonType({
    this.slot,
    this.type,
  });

  factory PokemonType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonType(
      slot: map['slot'],
      type: ApiResource.fromMap(map['type']),
    );
  }

  factory PokemonType.fromJson(String source) =>
      PokemonType.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonType(slot: $slot, type: $type)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type?.toMap(),
    };
  }
}
