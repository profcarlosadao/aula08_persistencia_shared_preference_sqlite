import 'package:get/get.dart';

class LoginController extends GetxController{
  final Rx<String?> _name = Rx(null);
  final Rx<String?> _password = Rx(null);
  Rx<String?> error = Rx(null);

  String get name => _name.value ?? "";
  String get password => _password.value ?? "";

  save(String name, String password) {
    bool hasError  = false;

    if(name.isEmpty){
      error.value = "O nome não pode ser vazio";
      hasError = true;
    }

    if(password.isEmpty){
      error.value = "O nome não pode ser vazio";
      hasError = true;
    }
    if(!hasError){

    }
  }
}