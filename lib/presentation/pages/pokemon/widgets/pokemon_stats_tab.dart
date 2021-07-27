import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_stat.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';

class PokemonStatTab extends StatelessWidget {
  PokemonStatTab({required this.pokemon, required this.species});

  final Pokemon pokemon;
  final PokemonSpecies species;

  List<TableRow> pokemonStats() {
    List<TableRow> list = [];
    int totalStat = 0;

    // Adding a Row with the stat name, value and a bar showing hao high it is
    for (PokemonStat pokemonStat in pokemon.stats) {
      Color fillColor = Colors.green;
      // Adding the stat to the total to add at the end
      totalStat += pokemonStat.base_stat;

      if (pokemonStat.base_stat < 60) {
        fillColor = Colors.red;
      } else if (pokemonStat.base_stat < 80) {
        fillColor = Colors.orange;
      }

      list.add(TableRow(children: [
        // Stat Name
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${pokemonStat.stat.name.capitalizeFirst}",
            style:
                AppTextThemes.kBodyTextStyle.copyWith(color: Colors.grey[600]),
          ),
        ),
        // Stat base Value
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${pokemonStat.base_stat}",
            style: AppTextThemes.kBodyTextStyle
                .copyWith(color: AppColors.kBackGroundColor),
          ),
        ),
        // Progress Bar
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: LinearProgressIndicator(
            value: pokemonStat.base_stat / 255,
            backgroundColor: Colors.grey[300],
            color: fillColor,
          ),
        ),
      ]));
    }

    // Choosing the color for the bar of the total stat
    Color fillColor = Colors.green;

    if (totalStat < 360) {
      fillColor = Colors.red;
    } else if (totalStat < 480) {
      fillColor = Colors.orange;
    }

    // Adding the final bar with the total base stat
    list.add(TableRow(children: [
      // Stat Name
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Total",
          style: AppTextThemes.kBodyTextStyle.copyWith(color: Colors.grey[600]),
        ),
      ),
      // Stat base Value
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "$totalStat",
          style: AppTextThemes.kBodyTextStyle
              .copyWith(color: AppColors.kBackGroundColor),
        ),
      ),
      // Progress Bar
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: LinearProgressIndicator(
          value: totalStat / (255 * 6),
          backgroundColor: Colors.grey[300],
          color: fillColor,
        ),
      ),
    ]));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(1.0),
          1: FlexColumnWidth(0.5),
          2: FlexColumnWidth(1.5)
        },
        children: pokemonStats(),
      ),
    );
  }
}
