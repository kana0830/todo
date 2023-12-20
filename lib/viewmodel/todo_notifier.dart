import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/todo.dart';

class TodosNotifier extends StateNotifier<CollectionReference<Map<String, dynamic>>> {
  TodosNotifier() : super(FirebaseFirestore.instance.collection('todo'));

  void get() {
    state = FirebaseFirestore.instance.collection('todo');
  }
  void addTodo(Todo todo) {}

  void removeTodo(String todoId) {}

}

final todosProvider = StateNotifierProvider<TodosNotifier, CollectionReference<Map<String, dynamic>>>((ref) {
  return TodosNotifier();
});
