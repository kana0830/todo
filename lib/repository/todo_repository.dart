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

  void updateTodo(id, value) async{
    await FirebaseFirestore.instance.collection('todo').doc(id).update({
      'endFlg' : value ? 1 : 0
    });
  }

  void insertTodo(value) async{
    await FirebaseFirestore.instance.collection('todo').add({
      'task' : value.task,
      'detail': value.detail,
      'endFlg' : 0,
    });
  }
}