import 'package:flutter/material.dart';
import '../util/snippets.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({super.key});

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  final TextEditingController _postController = TextEditingController();

  _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Post")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _postController,
              decoration: inputDecoration(label: "Novo Post"),
            ),
          ),
          ElevatedButton(onPressed: _onPressed, child: const Text("Salvar"))
        ],
      ),
    );
  }
}
