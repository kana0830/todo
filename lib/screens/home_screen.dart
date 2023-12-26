import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/viewmodel/todo_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);
    final todo = todos.when(
      loading: () => const Center(
        child: Column(children: [
          CircularProgressIndicator(
            color: Colors.green,
          ),
        ]),
      ),
      error: (e, s) => Text('エラー $e'),
      data: (d) => ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (var todo in d)
            Card(
              child: CheckboxListTile(
                value: todo.endFlg == 1 ? true : false,
                onChanged: (value) {
                  final notifier = ref.read(todoNotifierProvider.notifier);
                  notifier.updateState(todo.id, value);
                },
                title: Text(todo.task),
                subtitle: Text(todo.detail),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            )
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TODO一覧'),
        ),
        body: SingleChildScrollView(child: todo),
      ),
    );
  }
}
