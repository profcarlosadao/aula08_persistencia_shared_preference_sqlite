import 'package:get/get.dart';
import '../../datasource/shared_preference.datasource.dart';

class LoginController extends GetxController {
  final Rx<String?> _name = Rx(null);
  final Rx<String?> _password = Rx(null);
  final Rx<String?> error = Rx(null);
  late SharedPreferenceDataSource _preference;

  LoginController() {
    _preference = SharedPreferenceDataSource();
  }

  String get name => _name.value ?? "";
  String get password => _password.value ?? "";

  initController() async {
    await _preference.initPreference();
  }

  save(String name, String password) async {
    bool hasError = false;

    if (name.isEmpty) {
      error.value = "O nome não pode ser vazio";
      hasError = true;
    }

    if (password.isEmpty) {
      error.value = "O nome não pode ser vazio";
      hasError = true;
    }
    if (!hasError) {
      _preference.save('email', name);
      _preference.save('password', password);
    }
  }
}
