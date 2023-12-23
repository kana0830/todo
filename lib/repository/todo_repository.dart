import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/todo.dart';

class TodoRepository {

  @override
  Future<List<Todo>> getTodo() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('todo').get();
    final todos = querySnapshot.docs
        .map((doc) => Todo(doc, doc.id))
        .toList();
    return todos;
  }

  Future<void> updateTodo(id, value) async {
    FirebaseFirestore.instance.collection('users').doc(id).update({
      'endFlg' : 'value'
    });
  }
}