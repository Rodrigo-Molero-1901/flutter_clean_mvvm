import 'package:shared_preferences/shared_preferences.dart';

class LocalApiClient {
  late SharedPreferences _prefs;

  static Future<LocalApiClient> init() async {
    var client = LocalApiClient._();
    client._prefs = await SharedPreferences.getInstance();
    return client;
  }

  LocalApiClient._();

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
