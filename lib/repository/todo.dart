import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class Todo {

  late String task;
  late String detail;
  late bool endFlg;

  // Todo({required this.task, required this.detail, required this.endFlg});

  Future<String> getTodoList(DocumentSnapshot<Object?> document) async {
    var todo = FirebaseFirestore.instance.collection('todo').doc(document.id);
    return todo.toString();
  }
}