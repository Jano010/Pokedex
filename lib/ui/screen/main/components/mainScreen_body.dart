import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/assets_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/mainScreen_controller.dart';
import 'package:pokedex/ui/screen/main/components/main_card.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class MainBody extends StatelessWidget {
  final MainScreenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Hero(
              tag: 'logo',
              child: WebsafeSvg.asset(kCornerLogo,
                  color: kMainColorOpacity, height: 250.0),
            ),
          ],
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 36.0,
                  bottom: 28.0,
                  right: 28.0,
                  left: 28.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: kMainColor,
                            size: 36.0,
                          ),
                          onPressed: () => _controller.logout(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'What are you looking for?',
                      style: TextStyle(color: kMainColor, fontSize: 40.0),
                    ),
                    SizedBox(height: 60.0),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: MenuCard(
                            text: 'Pokedex',
                            backgroundColor: kGrassTypeColor,
                            onTap: () {},
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: MenuCard(
                            text: 'Moves',
                            backgroundColor: kFireTypeColor,
                            onTap: () =>
                                _controller.showUnderConstructionSnackbar(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: MenuCard(
                            text: 'Abilities',
                            backgroundColor: kWaterTypeColor,
                            onTap: () =>
                                _controller.showUnderConstructionSnackbar(),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: MenuCard(
                            text: 'Items',
                            backgroundColor: kElectricTypecolor,
                            onTap: () =>
                                _controller.showUnderConstructionSnackbar(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: MenuCard(
                            text: 'Locations',
                            backgroundColor: kGhostTypeColor,
                            onTap: () =>
                                _controller.showUnderConstructionSnackbar(),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: MenuCard(
                            text: 'Type Chart',
                            backgroundColor: kGroundTypeColor,
                            onTap: () =>
                                _controller.showUnderConstructionSnackbar(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
