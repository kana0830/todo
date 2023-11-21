import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/viewmodel/check_box_list_model.dart';

import '../viewmodel/check_box_list_model.dart';
import '../viewmodel/check_box_list_model.dart';

class HomeScreen extends StatelessWidget {
  // void moveToCreatePage(context) {
  //   Navigator.of(context).pushReplacementNamed('/todo_create');
  // }
  //
  // void deleteDoc(context, docId) async {
  //   await FirebaseFirestore.instance.collection('todo').doc(docId).delete();
  //   Navigator.of(context).pushReplacementNamed('/home');
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO一覧"),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('todo').get(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<DocumentSnapshot> todoSnapshot = snapshot.data!.docs;
          final List<Center> todoList = todoSnapshot.map((document) {
            return Center(
                child: CheckBoxListModel().modelToWidget(document),
            );
          }).toList();
          return Column(
                children: todoList
          );
        }),
      ),
    );
  }
}
