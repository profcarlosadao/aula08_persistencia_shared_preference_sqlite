import 'package:get/get.dart';
import '../../datasource/shared_preference.datasource.dart';

class LoginController extends GetxController {
  final Rx<String?> _name = Rx(null);
  final Rx<String?> _password = Rx(null);
  final Rx<String?> message = Rx(null);
  final Rx<bool> logged = Rx(false);
  late SharedPreferenceDataSource _preference;

  LoginController() {
    initController();
  }

  String get name => _name.value ?? "";

  String get password => _password.value ?? "";

  initController() async {
    _preference = SharedPreferenceDataSource();
    await _preference.initPreference();
    logged.value = await _preference.isLogged();
  }

  save(String email, String password) async {
    bool isValid = true;

    if (email.isEmpty) {
      message.value = "O nome não pode ser vazio";
      isValid = false;
    }

    if (password.isEmpty) {
      message.value = "O email não pode ser vazio";
      isValid = false;
    }

    if (isValid) {
      String? resEmail = await _preference.load("email");
      String? resPassword = await _preference.load("password");
      if (email == resEmail && password == resPassword) {
        logged.value = true;
      } else {
        message.value = "E-mail ou password incorreto!";
      }
    }
  }
}
