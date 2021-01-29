import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/ui/screen/list/components/list_body.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ListScreen extends StatelessWidget {
  static const String route = '/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForthColor,
      appBar: AppBar(
        backgroundColor: kForthColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Hero(
                tag: 'logo',
                child: WebsafeSvg.asset(kMainLogo,
                    height: 50.0, color: kMainColor),
              ),
              SizedBox(
                height: 16.0,
              ),
              Flexible(child: GeneralListBody()),
              Container(
                height: 40.0,
                color: kForthColor,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
