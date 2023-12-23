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
      loading: () => const Text('準備中'),
      error: (e, s) => Text('エラー $e'),
      data: (d) => ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (var todo in d)
            Card(
              child: CheckboxListTile(
                value: todo.endFlg,
                onChanged: (value) {
                  TodoNotifier().updateState(todo.id, value);
                },
                title: Text(todo.task),
                subtitle: Text(todo.detail),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO一覧'),
      ),
      body: SingleChildScrollView(child: todo),
    );
  }
}
