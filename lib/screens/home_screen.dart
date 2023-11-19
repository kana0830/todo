import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/repository/todo.dart';
import 'package:todo/viewmodel/checkBoxListModel.dart';

import '../viewmodel/checkBoxListModel.dart';
import '../viewmodel/checkBoxListModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var todos = [
      Todo(title: '散歩', subTitle: '10,000歩以上', isCheck: false, ),
      Todo(title: '筋トレ', subTitle: '胸・腕の日', isCheck: false, ),
      Todo(title: '勉強', subTitle: 'flutterのDB取得', isCheck: false, ),
      Todo(title: '買い物', subTitle: '旅行グッズ買う', isCheck: false, ),
      Todo(title: '掃除', subTitle: 'お風呂・キッチン', isCheck: false, ),
      Todo(title: '美容院', subTitle: 'アイロンとシャンプーも買う', isCheck: false, ),
    ];

    final list = ListView.builder(
      itemCount: todos.length,
      itemBuilder: (c, i) => CheckBoxListModel().modelToWidget(todos[i]),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),
      body: list
    );
  }
}


