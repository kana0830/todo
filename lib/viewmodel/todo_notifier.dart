import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/todo.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier(): super([]);

  Future<String> get() {
    return Todo().getTodoList();
  }
  void addTodo(Todo todo) {}

  void removeTodo(String todoId) {}

}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
