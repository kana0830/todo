import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/viewmodel/todo_notifier.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String task = '';
    String detail = '';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TODO登録'),
          actions: [
            IconButton(
                onPressed: () {
                  final notifier = ref.read(todoNotifierProvider.notifier);
                  notifier.insertState(task, detail);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'task',
                  border: InputBorder.none
                ),
                onChanged: (text){
                  task = text;
                },
              ),
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'detail',
                    border: InputBorder.none
                ),
                onChanged: (text){
                  detail = text;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
