import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setFirstTime(bool value) {
    prefs?.setBool('isFirstTime', value);
  }

  static bool getFirstTime() {
    return prefs?.getBool('isFirstTime') ?? true;
  }

  static void setLoggedIn(bool value) {
    prefs?.setBool('isLoggedIn', value);
  }

  static bool getLoggedIn() {
    return prefs?.getBool('isLoggedIn') ?? false;
  }
}
