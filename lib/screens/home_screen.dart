import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoList = ["筋トレ", "勉強", "洗濯回す"];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(
                    () {
                      isChecked = value!; // チェックボックスに渡す値を更新する
                    },
                  );
                },
              ),
              title: Text(todoList[index]),
              subtitle: Text('subtitle'),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
