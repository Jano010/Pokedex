import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_flavor_text.dart';
import 'package:pokedex/domain/entities/pokemon/pokemon_species.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';

class PokemonAboutTab extends StatelessWidget {
  PokemonAboutTab({required this.pokemon, required this.species});

  final Pokemon pokemon;
  final PokemonSpecies species;

  String pokemonFlavorText() {
    String flavorText = "";
    for (PokemonFlavorText flavorApi in species.flavor_text_entries) {
      if (flavorApi.language.name == "en") flavorText = flavorApi.flavor_text;
    }
    flavorText = flavorText.replaceAll("\n", " ");
    return flavorText;
  }

  List<Widget> pokemonEggGroups() {
    List<Widget> list = [];
    for (ApiResource groups in species.egg_groups) {
      list.add(Text(
        "${groups.name.capitalizeFirst},\t",
        style: AppTextThemes.kBodyTextStyle
            .copyWith(color: AppColors.kBackGroundColor),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.0,
        ),
        Text(
          pokemonFlavorText(),
          style: AppTextThemes.kBodyTextStyle
              .copyWith(color: AppColors.kBackGroundColor),
        ),
        SizedBox(
          height: 16.0,
        ),
        Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Text("Height",
                        style: AppTextThemes.kBodyTextStyle
                            .copyWith(color: Colors.grey[600])),
                    Text("Weight",
                        style: AppTextThemes.kBodyTextStyle
                            .copyWith(color: Colors.grey[600])),
                  ]),
                  TableRow(children: [
                    Text(
                      "${pokemon.height * 10} cm",
                      style: AppTextThemes.kBodyTextStyle
                          .copyWith(color: AppColors.kBackGroundColor),
                    ),
                    Text(
                      "${pokemon.weight / 10} kg",
                      style: AppTextThemes.kBodyTextStyle
                          .copyWith(color: AppColors.kBackGroundColor),
                    )
                  ])
                ],
              ),
            )),
        SizedBox(
          height: 16.0,
        ),
        Text(
          "Breeding",
          style: AppTextThemes.kBodyTextStyle.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.kBackGroundColor),
        ),
        SizedBox(
          height: 8.0,
        ),
        Table(
          children: [
            TableRow(children: [
              Text("Gender",
                  style: AppTextThemes.kBodyTextStyle
                      .copyWith(color: Colors.grey[600])),
              Row(
                children: [
                  Icon(
                    Icons.male,
                    color: Colors.blue[900],
                  ),
                  Text(
                    "${((8 - species.gender_rate) / 8) * 100}",
                    style: AppTextThemes.kBodyTextStyle
                        .copyWith(color: AppColors.kBackGroundColor),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Icon(
                    Icons.female,
                    color: Colors.pink,
                  ),
                  Text(
                    "${(species.gender_rate / 8) * 100}",
                    style: AppTextThemes.kBodyTextStyle
                        .copyWith(color: AppColors.kBackGroundColor),
                  ),
                ],
              )
            ]),
            TableRow(children: [
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 8.0,
              )
            ]),
            TableRow(children: [
              Text("Egg Groups",
                  style: AppTextThemes.kBodyTextStyle
                      .copyWith(color: Colors.grey[600])),
              Row(
                children: pokemonEggGroups(),
              )
            ]),
            TableRow(children: [
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 8.0,
              )
            ]),
            TableRow(children: [
              Text("Hatch Rate",
                  style: AppTextThemes.kBodyTextStyle
                      .copyWith(color: Colors.grey[600])),
              Text(
                "${(species.hatch_counter + 1) * 255} steps",
                style: AppTextThemes.kBodyTextStyle
                    .copyWith(color: AppColors.kBackGroundColor),
              ),
            ]),
          ],
        )
      ],
    );
  }
}
