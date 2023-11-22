import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class Todo {

  late String task;
  late String detail;
  late bool endFlg;

  Todo({required this.task, required this.detail, required this.endFlg});
}