import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/styles_constants.dart';
import 'package:pokedex/core/controllers/favouritePkmn_controller.dart';
import 'package:pokedex/ui/screen/favourite_pkmn/components/favouritePkmn_gridView.dart';

class FavouritePkmnBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavouritePkmnController _controller =
        FavouritePkmnController.instance;

    return Stack(children: [
      Align(
        alignment: Alignment.topRight,
        child: Hero(
          tag: 'logo',
          child: SvgPicture.asset('assets/logo_corner.svg'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 52.0),
        child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => _controller.signOut(),
            child: Icon(
              Icons.logout,
              color: kMainColor,
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Favourite Pokemon',
              style: kTitleStyle,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          FavouritePkmnGrid()
        ],
      ),
    ]);
  }
}
