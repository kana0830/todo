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
  void updateState(id, value) async{
    _todoRepository.updateTodo(id, value);
    var updatedTodos = await _todoRepository.getTodo();
    todos = updatedTodos;
    state = AsyncData<List<Todo>>(todos);
  }

  void insertState(value) async{
    _todoRepository.insertTodo(value);
    // var updatedTodos = await _todoRepository.getTodo();
    // todos = updatedTodos;
    // state = AsyncData<List<Todo>>(todos);
  }
}