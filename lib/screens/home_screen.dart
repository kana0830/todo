import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/provider/is_check_notifier.dart';
import 'package:todo/viewmodel/check_box_list_model.dart';

class HomeScreen extends ConsumerWidget {
  @override

  final AutoDisposeStateProvider<bool> _isCheckedProvider =
  StateProvider.autoDispose((ref) {
    return false;
  });

  Widget build(BuildContext context, WidgetRef ref) {
    final bool isChecked = ref.watch(_isCheckedProvider);

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
            var value = document['endFlg'];
            return Center(
                child: Card(
              child: CheckboxListTile(
                value: value,
                onChanged: (value) {
                  // ノティファイアを呼ぶ
                  final notifier = ref.read(isCheckNotifierProvider.notifier);
                  // データの変更
                  value = notifier.updateState(document);
                },
                title: Text(document['task']),
                subtitle: Text(document['detail']),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ));
          }).toList();
          return Column(children: todoList);
        }),
      ),
    );
  }
}
