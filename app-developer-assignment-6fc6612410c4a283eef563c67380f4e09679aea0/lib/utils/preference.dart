import 'package:get_storage/get_storage.dart';

class Preference {
  static var _storage = GetStorage();
  static var LOGGED_IN = "LOGGED_IN";

  static bool isLoggedIn() {
    return _storage.read(LOGGED_IN) ?? false;
  }

  static Future<void> setLoggedIn(bool loggedIn) async {
    await _storage.write(LOGGED_IN, loggedIn);
  }
}
