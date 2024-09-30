import 'package:aula08_persistencia_shared_preference_sqlite/datasource/shared_preference.datasource.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final Rx<String> _name = Rx("");
  final Rx<String> _email = Rx("");
  final Rx<String> _password = Rx("");
  final Rx<String?> message = Rx("");
  final Rx<bool> registered = Rx(false);
  late SharedPreferenceDataSource _preference;

  RegisterController(){
    initRegister();
  }

  initRegister() async {
    _preference = SharedPreferenceDataSource();
    await _preference.initPreference();
  }
  Rx<String> get name => _name;

  Rx<String> get email => _email;

  Rx<String> get password => _password;

  save(String name, String email, String password){
    bool isValid = true;

    if(name.isEmpty){
      isValid = false;
      message.value = "O nome está vazio";
    }

    if(name.isEmpty){
      isValid = false;
      message.value = "O nome está vazio";
    }

    if(name.isEmpty){
      isValid = false;
      message.value = "O nome está vazio";
    }

    if(isValid) {
      _preference.save("name", name);
      _preference.save("email", email);
      _preference.save("password", password);
      registered.value = true;
    }
  }

}
