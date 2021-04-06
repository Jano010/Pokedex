import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/favouritePkmn_controller.dart';

class FavouritePkmnFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavouritePkmnController _controller =
        FavouritePkmnController.instance;

    return FloatingActionButton(
        backgroundColor: kAccentColor,
        child: Icon(
          Icons.search,
          color: kMainColor,
        ),
        onPressed: () => _controller.goToSearchScreen());
  }
}
