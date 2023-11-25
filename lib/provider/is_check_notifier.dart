import 'dart:ffi';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'isCheck.g.dart';

@Riverpod
class IsCheckNotifier extends _$IsCheckNotifier {
  @override
  bool build () {
    return false;
  }


  // 状態を変更するコード
  void updateState() {
    // 変更前のデータ
    final oldState = state;
    // 変更後のデータ
    final newState = state;

    retur
  }
}