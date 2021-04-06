import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screen/favourite_pkmn/components/favouritePkmn_body.dart';
import 'package:pokedex/ui/screen/favourite_pkmn/components/favouritePkmn_floatingButton.dart';

class FavouritePkmnScreen extends StatelessWidget {
  static const route = '/favourite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForthColor,
      body: SafeArea(child: FavouritePkmnBody()),
      floatingActionButton: FavouritePkmnFloating(),
    );
  }
}
