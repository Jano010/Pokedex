import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/models/resources_models.dart';
import 'package:pokedex/core/utils/extensions.dart';

class SearchListTile extends StatelessWidget {
  SearchListTile(
      {@required this.number,
      @required this.apiResource,
      @required this.onTapCallback});

  final int number;
  final ApiResource apiResource;
  final Function onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kForthColor,
      child: ListTile(
        leading: Text(
          '#$number',
          style: TextStyle(color: kMainColor),
        ),
        title: Text(
          '${apiResource.name.capitalize()}',
          style: TextStyle(color: kMainColor),
        ),
        onTap: onTapCallback,
      ),
    );
  }
}
