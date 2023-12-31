import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TODO登録'),
          actions: [
            IconButton(onPressed: () => _addTodo, icon: Icon(Icons.add))
          ],
        ),
        body: Container(
          width: double.infinity,
          child: const TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}
