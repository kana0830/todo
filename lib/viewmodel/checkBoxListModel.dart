import 'package:flutter/material.dart';
import 'package:todo/screens/home_screen.dart';

import '../repository/todo.dart';


class CheckBoxListModel {

  // モデル => ウィジェット に変換する
  Widget modelToWidget(Todo model) {
    // タイトル
    final title = model.title;
    final subtitle = model.subTitle;
    final ischeck = model.isCheck;

    // 部品を並べる
    return Card(
      child: CheckboxListTile(
        value: ischeck,
        onChanged: (value) {
          itemChange(model, value!);
        },
        title: Text(title),
        subtitle: Text(subtitle),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  void itemChange(var model, bool value) {
    model.isCheck = value;
  }
}