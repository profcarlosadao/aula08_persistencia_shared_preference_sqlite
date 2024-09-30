import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDataSource {
  late SharedPreferences prefs;

  initPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  save(String key, String value) async {
    await prefs.setString(key, value);
  }

  Future<String?> load(String key) async {
    final String? action = prefs.getString(key);
    return action;
  }
}