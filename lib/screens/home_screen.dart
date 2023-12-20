import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/todo.dart';
import '../viewmodel/todo_notifier.dart';

class HomeScreen extends ConsumerWidget {
  @override
  final AutoDisposeStateProvider<bool> _isCheckedProvider =
  StateProvider.autoDispose((ref) {
    return false;
  });

  Widget build(BuildContext context, WidgetRef ref) {
    CollectionReference<Map<String, dynamic>> todos = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO一覧'),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final todo in todos)
              ListTile(
                title: Text(todo.task),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    ref.read(todosProvider.notifier);
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(todosProvider.notifier);
        },
      ),
    );
  }
}
