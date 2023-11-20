import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/home_screen.dart';

import '../repository/todo.dart';


class CheckBoxListModel {

  Future<String> get() async {
    CollectionReference todo = FirebaseFirestore.instance.collection('todo');
    final doc = await todo.doc('1').get();
    return todo.toString();
  }

  // モデル => ウィジェット に変換する
  Widget modelToWidget(DocumentSnapshot<Object?> document) {
    // タイトル
    final title = document['title'];
    final subtitle = document['subtitle'];
    final ischeck = document['isCheck'];

    // 部品を並べる
    return Card(
      child: CheckboxListTile(
        value: ischeck,
        onChanged: (value) {
          // itemChange(document, value!);
        },
        title: Text(title),
        subtitle: Text(subtitle),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  // void itemChange(var model, bool value) {
  //   model.isCheck = value;
  // }
}