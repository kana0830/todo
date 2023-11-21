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
    final task = document['task'];
    final detail = document['detail'];
    final endFlg = document['endFlg'];

    // 部品を並べる
    return Card(
      child: CheckboxListTile(
        value: endFlg,
        onChanged: (value) {
          // itemChange(document, value!);
        },
        title: Text(task),
        subtitle: Text(detail),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

// void itemChange(var model, bool value) {
//   model.isCheck = value;
// }
}
