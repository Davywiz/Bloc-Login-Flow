import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  //set token
  Future<void> setToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  //clear token
  Future<void> clearToken() async {
    _sharedPreferences.remove(PREFS_KEY_TOKEN);
  }

  //get token
  Future<String> getToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? '';
  }

  //set isUserLogged In
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(
          PREFS_KEY_IS_USER_LOGGED_IN,
        ) ??
        false;
  }

  //clear isUserLogged In
  Future<void> clearUserLoggedIn() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}
