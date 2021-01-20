import 'package:flutter/cupertino.dart';
import 'package:pokedex/core/models/base_list_model.dart';
import 'package:pokedex/core/services/network/network_service.dart';
import 'package:pokedex/core/utils/network_util.dart';

class ListsViewModel extends ChangeNotifier {
  final NetworkManager _networkManager = NetworkManager.getInstance();
  final NetworkService _networkService = NetworkService();
  BaseApiList _baseList;
  bool _loading = false;
  List<BaseApiListItem> _results = [];

  BaseApiList get baseList => _baseList;
  List<BaseApiListItem> get results => _results;
  bool get loading => _loading;

  void getPokemonList() async {
    try {
      if (await _networkManager.thereIsInternetConnection()) {
        load();
        var response = await _networkService.callPokemonListService();
        dismissLoad();
        printResponse(code: response.statusCode, body: response.body);
        if (response.statusCode == 200) {
          _baseList = BaseApiList.fromRawJson(response.body);
          _results.addAll(_baseList.results);
          notifyListeners();
        } else {
          // TODO: Logic if there was an error in the server
        }
      } else {
        // TODO: There is no internet connection logic
      }
    } catch (e) {
      print(e);
      // TODO: Logic if there there was an error making the service call
    }
  }

  void getNextList({@required String listUrl}) async {
    try {
      if (await _networkManager.thereIsInternetConnection()) {
        var response =
            await _networkService.callNextItemListService(url: listUrl);
        printResponse(code: response.statusCode, body: response.body);
        if (response.statusCode == 200) {
          _baseList = BaseApiList.fromRawJson(response.body);
          _results.addAll(_baseList.results);
          notifyListeners();
        } else {
          // TODO: Logic if there was an error in the server
        }
      } else {
        // TODO: There is no internet connection logic
      }
    } catch (e) {
      print(e);
      // TODO: Logic if there there was an error making the service call
    }
  }

  // void getPokemon({@required String url}) async {
  //   try {
  //     if (await _networkManager.thereIsInternetConnection()) {
  //       var response = await
  //     }
  //   } catch (e) {}
  // }

  void load() {
    _loading = true;
    notifyListeners();
  }

  void dismissLoad() {
    _loading = false;
    notifyListeners();
  }

  void printResponse({@required int code, @required String body}) {
    print('Http Response code: $code');
    print('Http Response body: $body');
  }
}
