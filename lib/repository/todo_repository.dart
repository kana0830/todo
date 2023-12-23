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
    var flugValue = 0;
    if(value){
      flugValue = 1;
    }
    FirebaseFirestore.instance.collection('todo').doc(id).update({
      'endFlg' : flugValue
    });
    print('update');
  }
}