import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pokedex/core/constants/api_constants.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/controllers/searchScreen_controller.dart';
import 'package:pokedex/ui/screen/search/components/search_listTile.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      initState: (_) => SearchScreenController.instance
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
                return SearchListTile(
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
