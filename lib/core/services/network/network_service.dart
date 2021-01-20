import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/core/constants/api_constants.dart';

class NetworkService {
  Map<String, String> baseHeaders = {'Accept': 'application/json'};

  Future<http.Response> callPokemonListService() {
    return http.get(Uri.encodeFull('${kBasePokemonUrl}pokemon'),
        headers: baseHeaders);
  }

  Future<http.Response> callNextItemListService({@required String url}) {
    return http.get(Uri.encodeFull(url), headers: baseHeaders);
  }

  Future<http.Response> callPokemonService({@required String pokemon}) {
    return http.get(Uri.encodeFull('${kBasePokemonUrl}pokemon/${pokemon}/'));
  }
}
