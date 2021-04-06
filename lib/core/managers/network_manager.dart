import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/core/models/pokemon_models.dart';
import 'package:pokedex/core/models/resources_models.dart';
import 'package:get/get.dart';
import 'dart:io';

class NetworkManager extends GetxController {
  /*==========================================================================*/
  /*  Singleton Creation  */
  /*==========================================================================*/

  static final NetworkManager _instance = NetworkManager._internal();

  factory NetworkManager() {
    return _instance;
  }

  NetworkManager._internal() {
    debugPrint("NetworkManager initiated");
  }

  static NetworkManager get instance => Get.find();

  /*==========================================================================*/
  /*  Logic  */
  /*==========================================================================*/

  Map<String, String> baseHeaders = {'Accept': 'application/json'};

  static Future<bool> thereIsInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e);
      return false;
    }
  }

  void printResponse({@required http.Response response}) {
    print('Http Response Code: ${response.statusCode}');
    print('Http Response Body: ${response.body}');
  }

  Future<ApiResourceList> callResourcesListService(
      {@required String url}) async {
    ApiResourceList _list;

    final http.Response response =
        await http.get(Uri.https(url, ''), headers: baseHeaders);
    printResponse(response: response);

    if (response.statusCode == 200) {
      _list = ApiResourceList.fromJson(response.body);
    } else {
      _list = null;
    }

    return _list;
  }

  Future<Pokemon> obtainPokemon({@required String pokemon}) async {
    final String _pokemonUrl = 'https://pokeapi.co/api/v2/pokemon/';

    if (pokemon == '') {
      return null;
    }

    final http.Response response =
        await http.get(Uri.parse(_pokemonUrl + pokemon), headers: baseHeaders);
    printResponse(response: response);

    if (response.statusCode == 200) {
      return Pokemon.fromJson(response.body);
    } else {
      return null;
    }
  }
}
