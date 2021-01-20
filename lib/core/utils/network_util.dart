import 'dart:async';
import 'dart:io';

class NetworkManager {
  /*--------------------------------------------------------------------------*/
  /*  Singleton Elements  */
  /*--------------------------------------------------------------------------*/

  // Create the single instance
  static final NetworkManager _instance = NetworkManager._internal();

  // Using factory to make sure that we return on objet of this tye but doesn't create a new one
  factory NetworkManager() {
    return _instance;
  }

  // Real constructor it will be call by the instance variable only once
  NetworkManager._internal() {
    // Init logic
  }

  // Getter to get the instance through the app
  static NetworkManager getInstance() => _instance;

  /*--------------------------------------------------------------------------*/
  /*  Normal class Elements  */
  /*--------------------------------------------------------------------------*/

  Future<bool> thereIsInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
