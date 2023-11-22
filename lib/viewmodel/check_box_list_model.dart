import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckBoxListModel {
  Future<String> get() async {
    CollectionReference todo = FirebaseFirestore.instance.collection('todo');
    return todo.toString();
  }

  // モデル => ウィジェット に変換する
  Widget modelToWidget(DocumentSnapshot<Object?> document) {
    // タイトル
    final task = document['task'];
    final detail = document['detail'];
    var endFlg = document['endFlg'];

    void itemChange(bool value) {
      endFlg = value;
    }

    // 部品を並べる
    return Card(
      child: CheckboxListTile(
        value: endFlg,
        onChanged: (value) {
          itemChange(value!);
        },
        title: Text(task),
        subtitle: Text(detail),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }


}