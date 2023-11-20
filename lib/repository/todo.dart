import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class Todo {

  late String title;
  late String subTitle;
  late bool isCheck;



  Todo({required this.title, required this.subTitle, required this.isCheck});


}