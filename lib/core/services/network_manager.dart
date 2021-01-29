import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/core/models/resources_models.dart';
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

  /*==========================================================================*/
  /*  Logic  */
  /*==========================================================================*/

  Map<String, String> baseHeaders = {'Accept': 'application/json'};

  Future<bool> thereIsInternetConnection() async {
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

  void printResponse({@required int code, @required String body}) {
    print('Http Response Code: $code');
    print('Http Response Body: $body');
  }

  Future<ApiResourceList> callResourcesListService(
      {@required String url}) async {
    ApiResourceList _list;

    final http.Response response =
        await http.get(Uri.encodeFull(url), headers: baseHeaders);
    printResponse(code: response.statusCode, body: response.body);

    if (response.statusCode == 200) {
      _list = ApiResourceList.fromJson(response.body);
    } else {
      _list = null;
    }

    return _list;
  }
}
