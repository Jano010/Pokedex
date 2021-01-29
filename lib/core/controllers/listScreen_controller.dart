import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/models/resources_models.dart';
import 'package:pokedex/core/services/network_manager.dart';

class ListScreenController extends GetxController {
  NetworkManager _networkManager;

  ApiResourceList _resources;
  List<ApiResource> _resourcesList;

  ApiResourceList get resources => _resources;
  List<ApiResource> get resourcesList => _resourcesList;
  static ListScreenController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _networkManager = NetworkManager();
    _resourcesList = [];
  }

  void getResourceList({@required String url}) async {
    _resources = await _networkManager.callResourcesListService(url: url);
    resourcesList.addAll(_resources.results);
    update();
  }

  void paginationHandler(int index) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 20 == 0 && itemPosition != 0;

    if (requestMoreData) {
      getResourceList(url: _resources.next);
    }
  }

  void onPokemonTap({@required ApiResource pokemon}) {
    // navigator.pushNamed();
    print('${pokemon.name}');
  }
}
