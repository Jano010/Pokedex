import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/pokemonScreen_cotroller.dart';
import 'package:pokedex/ui/screen/pokemon/components/generalInfo_tab.dart';
import 'package:pokedex/ui/screen/pokemon/components/habitatInfo_tab.dart';
import 'package:pokedex/ui/screen/pokemon/components/movesInfo_tab.dart';

class PokemonInfoSheet extends StatefulWidget {
  @override
  _PokemonInfoSheetState createState() => _PokemonInfoSheetState();
}

class _PokemonInfoSheetState extends State<PokemonInfoSheet> {
  final PokemonScreenController _controller = PokemonScreenController.instance;

  final List<String> tabs = ['General', 'Moves', 'Habitat'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(
          controller: _controller.tabController,
          indicatorColor: kAccentColor,
          labelColor: kThirdColor,
          labelPadding: EdgeInsets.symmetric(horizontal: 28.0),
          isScrollable: true,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Expanded(
          child: TabBarView(
            controller: _controller.tabController,
            children: [
              GeneralInfoTab(),
              MovesInfoTab(),
              HabitatInfoTab(),
            ],
          ),
        ),
      ],
    );
  }
}
