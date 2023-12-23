import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {

  late String id;
  late String task;
  late String detail;
  late int endFlg;

  Todo(DocumentSnapshot doc, docId) {
    id = docId;
    task = doc['task'];
    detail = doc['detail'];
    endFlg = doc['endFlg'];
  }
}