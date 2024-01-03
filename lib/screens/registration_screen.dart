import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/viewmodel/todo_notifier.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                  Fluttertoast.showToast(
                      msg: '登録しました',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM);
                  task = '';
                  detail = '';
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: '　task',
                  ),
                  onChanged: (text) {
                    task = text;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: '　detail',
                  ),
                  onChanged: (text) {
                    detail = text;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
