import 'package:safe_extensions/safe_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalApiClient {
  late SharedPreferences _prefs;

  static Future<LocalApiClient> init() async {
    var client = LocalApiClient._();
    client._prefs = await SharedPreferences.getInstance();
    return client;
  }

  LocalApiClient._();

  Future<bool> setString(String key, {required String value}) async {
    return await _prefs.setString(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key).safeValue;
  }

  Future<bool> setInt(String key, {required int value}) async {
    return await _prefs.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs.getInt(key).safeValue;
  }

  Future<bool> setBool(String key, {required bool value}) async {
    return await _prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs.getBool(key).safeValue;
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
