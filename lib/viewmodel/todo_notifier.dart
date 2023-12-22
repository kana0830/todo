// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../repository/todo.dart';
//
// class TodosNotifier extends StateNotifier<List<Todo>> {
//   TodosNotifier(): super([]);
//   var todo = Todo().getTodoList();
//
//   Future<List<String>> get() async {
//     return todo;
//   }
//   void addTodo(Todo todo) {
//
//   }
//
//   void removeTodo(String todoId) {
//
//   }
//
// }
//
// final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
//   return TodosNotifier();
// });
//
