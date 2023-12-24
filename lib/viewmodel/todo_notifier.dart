import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/todo.dart';
import '../repository/todo_repository.dart';
part '../repository/todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  List<Todo> todos = [];
  final _todoRepository = TodoRepository();

  @override
  Future<List<Todo>> build() async{
    todos = await _todoRepository.getTodo();
    return todos;
  }

  // update
  void updateState(id, value) {
    _todoRepository.updateTodo(id, value);
    // todos[int.parse(id)-1].endFlg = value ? 1 : 0;
  }
}