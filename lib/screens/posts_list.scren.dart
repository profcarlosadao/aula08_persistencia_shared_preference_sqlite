import 'package:flutter/material.dart';

class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de posts")),
      body: ListView(
        children: [],
      )
    );
  }
}
