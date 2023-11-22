import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/viewmodel/check_box_list_model.dart';

class HomeScreen extends StatelessWidget {

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
