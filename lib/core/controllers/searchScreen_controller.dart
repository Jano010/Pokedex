import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/constants/translations_constants.dart';
import 'package:pokedex/core/models/resources_models.dart';
import 'package:pokedex/core/managers/network_manager.dart';
import 'package:pokedex/ui/components/main_snackbar.dart';
import 'package:pokedex/ui/screen/pokemon/pokemon_screen.dart';

class SearchScreenController extends GetxController {
  NetworkManager _networkManager;

  ApiResourceList _resources;
  List<ApiResource> _resourcesList;

  ApiResourceList get resources => _resources;
  List<ApiResource> get resourcesList => _resourcesList;
  static SearchScreenController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    _networkManager = NetworkManager();
    _resourcesList = [];
  }

  void getResourceList({@required String url}) async {
    print('Making Resource Call');
    if (url != null) {
      if (await NetworkManager.thereIsInternetConnection()) {
        _resources = await _networkManager.callResourcesListService(url: url);
        resourcesList.addAll(_resources.results);
        update();
      } else {
        MainSnackbar.show(
            title: kGenericErrorMsg, msg: 'There is no internet connection');
      }
    }
  }

  void paginationHandler(int index) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 20 == 0 && itemPosition != 0;

    if (requestMoreData) {
      getResourceList(url: _resources.next);
    }
  }

  void onPokemonTap({@required ApiResource pokemon}) {
    navigator.pushNamed(PokemonScreen.route, arguments: pokemon.url);
  }
}
