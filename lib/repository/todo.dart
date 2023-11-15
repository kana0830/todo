import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class Todo {

  Future<DocumentSnapshot> get() async {
    CollectionReference todo = FirebaseFirestore.instance.collection('todo');
    final doc = await todo.doc('1').get();
    return doc;
  }

}