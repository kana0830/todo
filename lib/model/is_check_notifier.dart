import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'is_check_notifier.g.dart';

@riverpod
class IsCheckNotifier extends _$IsCheckNotifier {
  @override
  // Future<Widget> build () async {
  //   return state;
  // }
  Future<String> build() async {
    CollectionReference todo = FirebaseFirestore.instance.collection('todo');
    return todo.toString();
  }


  // 状態を変更するコード
  bool updateState(DocumentSnapshot<Object?> document) {
    // 変更後のデータ
    var newState = false;
    if (document['endFlg'] == true) {
      newState = false;
    } else {
      newState = true;
    }
    FirebaseFirestore.instance.collection('todo').doc(document.id).update({
      'endFlg' : newState
    });
    var endFlg = false;
    FirebaseFirestore.instance.collection('todo')
        .doc(document.id).snapshots().listen((DocumentSnapshot snapshot) {
      endFlg = snapshot.get('endFlg');
    });
    return endFlg;
  }
}