import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokeballLogo extends StatefulWidget {
  PokeballLogo({@required this.height});
  final double height;

  @override
  _PokeballLogoState createState() => _PokeballLogoState();
}

class _PokeballLogoState extends State<PokeballLogo> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'pokeballLogo',
      child: SvgPicture.asset(
        kpokeballLogo,
        height: widget.height,
        color: kpokeballLogoColor,
      ),
    );
  }
}
