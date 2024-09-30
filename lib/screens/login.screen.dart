import 'package:aula08_persistencia_shared_preference_sqlite/screens/controller/login.controller.dart';
import 'package:flutter/material.dart';
import '../util/snippets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginController _loginController;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginController = LoginController();
    super.dispose();
  }

  _onPressed() {
    _loginController.save(
        _emailController.text,
        _passwordController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: inputDecoration(label: "Informe o e-mail"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _passwordController,
              decoration: inputDecoration(label: "Informe password"),
            ),
          ),
          ElevatedButton(onPressed: _onPressed, child: const Text("Salvar"))
        ],
      ),
    );
  }
}
