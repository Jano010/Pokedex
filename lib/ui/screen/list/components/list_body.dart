import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pokedex/core/constants/api_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/core/controllers/listScreen_controller.dart';
import 'package:pokedex/ui/screen/list/components/list_tile.dart';

class GeneralListBody extends StatefulWidget {
  @override
  _GeneralListBodyState createState() => _GeneralListBodyState();
}

class _GeneralListBodyState extends State<GeneralListBody> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListScreenController>(
      initState: (_) => ListScreenController.to
          .getResourceList(url: kApiUrl + kPokemonEndpoint),
      builder: (controller) => controller.resourcesList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: controller.resourcesList.length,
              separatorBuilder: (context, index) => Divider(
                color: kMainColorOpacity40,
                thickness: 2.0,
                height: 2.0,
              ),
              itemBuilder: (context, index) {
                controller.paginationHandler(index);
                return GeneralListTile(
                  number: index + 1,
                  apiResource: controller.resourcesList[index],
                  onTapCallback: () => controller.onPokemonTap(
                      pokemon: controller.resourcesList[index]),
                );
              },
            ),
    );
  }
}
