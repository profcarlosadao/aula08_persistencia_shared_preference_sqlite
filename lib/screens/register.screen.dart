import 'package:aula08_persistencia_shared_preference_sqlite/screens/controller/register.controller.dart';
import 'package:aula08_persistencia_shared_preference_sqlite/screens/login.screen.dart';
import 'package:aula08_persistencia_shared_preference_sqlite/util/snippets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameTextEditController = TextEditingController();
  final TextEditingController _emailTextEditController = TextEditingController();
  final TextEditingController _passwordTextEditController = TextEditingController();
  late RegisterController _registerController;
  final List<void Function()> _disposers = [];

  @override
  void initState() {
    _registerController = RegisterController();
    _listener();
    super.initState();
  }

  _listener() {
    _disposers.add(ever(_registerController.message, (String? value) {
      if(value != null){
        snackBar(context, value);
      }
    }).call);

    _disposers.add(ever(_registerController.registered, (bool value) {
      if(value){
        openRoute(context, const LoginScreen());
      }
    }).call);
  }

  _onPressed() {
    _registerController.save(
      _nameTextEditController.text,
      _emailTextEditController.text,
      _passwordTextEditController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Cadastro",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _nameTextEditController,
              decoration: inputDecoration(label: "informe o nome"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _emailTextEditController,
              decoration: inputDecoration(label: "informe o nome"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _passwordTextEditController,
              decoration: inputDecoration(label: "informe o nome"),
            ),
          ),
          ElevatedButton(onPressed: _onPressed, child: const Text("Salvar")),
           Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Já tem conta? "),
                InkWell(
                  onTap: (){
                    openRoute(context, const LoginScreen());
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
