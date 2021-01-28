import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    @required this.text,
    @required this.backgroundColor,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(16.0)),
        ),
        elevation: 8.0,
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            WebsafeSvg.asset(
              kCardLogo,
              color: kMainColorOpacity40,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
