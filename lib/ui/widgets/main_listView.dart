import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/colors_constants.dart';
import 'package:pokedex/core/view_models/lists_viewModel.dart';
import 'package:pokedex/ui/screens/pokemon_screen.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/core/utils/strings_extensions.dart';

class MainList extends StatefulWidget {
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  String nextUrl = '';
  ScrollController _scrollController;
  final ListsViewModel viewModel = ListsViewModel();

  /*--------------------------------------------------------------------------*/
  /*  Lifecycle and UI  */
  /*--------------------------------------------------------------------------*/

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    viewModel.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListsViewModel>(
      create: (_) => viewModel,
      child: Consumer<ListsViewModel>(builder: (context, viewModel, __) {
        return ListView.separated(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              child: ListTile(
                leading: Text('#${index + 1}'),
                title: Text('${viewModel.results[index].name.capitalize()}'),
                onTap: () {
                  Navigator.pushNamed(context, PokemonScreen.route,
                      arguments: {'pokemon': viewModel.results[index].name});
                },
              ),
            );
          },
          itemCount: viewModel.results.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            indent: 16.0,
            color: kSecondaryTextColor,
            thickness: 1.0,
            height: 1.0,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /*--------------------------------------------------------------------------*/
  /*  Logic  */
  /*--------------------------------------------------------------------------*/

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      viewModel.getNextList(listUrl: viewModel.baseList.next);
    }
  }
}
