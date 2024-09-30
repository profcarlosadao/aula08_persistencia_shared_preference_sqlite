import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDataSource {
  late SharedPreferences prefs;

  initPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> isLogged() async {
    final bool? action = prefs.getBool("logged");
    return action ?? false;
  }

  saveLogged(String value) async {
    await prefs.setString("logged", value);
  }

  Future<String?> load(String key) async {
    final String? action = prefs.getString(key);
    return action;
  }

  save(String key, String value) async {
    await prefs.setString(key, value);
  }
}