import 'package:aula08_persistencia_shared_preference_sqlite/screens/post_create.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../util/snippets.dart';
import 'controller/login.controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<void Function()> _disposers = [];
  late LoginController _loginController;

  @override
  void initState() {
    _loginController = LoginController();
    _listener();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  //Defininindo o ouvinte
  _listener() {
    _disposers.add(ever(_loginController.logged, (bool value) {
      if(value){
        openRoute(context, const PostCreateScreen());
      }
    }).call);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                controller: _passwordController,
                decoration: inputDecoration(label: "Informe password"),
              ),
            ),
            ElevatedButton(onPressed: _onPressed, child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
