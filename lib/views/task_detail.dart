import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskhawk/data_service.dart';
import 'package:taskhawk/views/task_board.dart';

final taskIDProvider = StateProvider((ref) => '');
final choiceIndexProvider = StateProvider((ref) => -1);
final supplierList = ['A社', 'B社', 'C社'];
final taskDetailtitleProvider = StateProvider((ref) => TextEditingController(text: ''));
final taskDetailbodyProvider = StateProvider((ref) => TextEditingController(text: ''));

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ログアウトに必要なメソッドを呼び出す
    // final authController = ref.read(authAsyncNotifierController.notifier);

    final taskID = ref.read(taskIDProvider);
    final taskTitle = ref.watch(taskDetailtitleProvider);
    final taskBody = ref.watch(taskDetailbodyProvider);

    final dataService = ref.read(dataServiceProvider.notifier).state;

    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          actions: [
            IconButton(
                onPressed: () async {
                  // ログアウトするメソッド
                  // authController.signOutAnonymously(context);
                },
                icon: const Icon(Icons.logout))
          ],
          title: _pageTitle(taskID),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: taskTitle, decoration: InputDecoration(labelText: 'Task Name'), enabled: true),
              const SizedBox(height: 20.0),
              TextField(
                controller: taskBody,
                decoration: InputDecoration(labelText: 'Task Detail'),
              ),
              const SizedBox(height: 20.0),
              SupplierChoices(),
              const SizedBox(height: 20.0),
              _buttons(taskID, dataService, taskTitle, taskBody, context),
              // ElevatedButton(
              //     onPressed: () async {
              //       // データを保存するメソッドを使用する。ボタンを押すと実行される
              //       dataService.updateTask(taskID, taskTitle.text, taskBody.text, 'status', 'supplier', context);
              //       // ブログの投稿ページへ画面遷移する
              //       Navigator.of(context).pop();
              //       // Navigator.of(context).push(
              //           // MaterialPageRoute(builder: (context) => const TaskBoard()));
              //     },
              //     child: const Text('更新する')),
              // const SizedBox(height: 20.0),
              // ElevatedButton(
              //     onPressed: () async {
              //       dataService.deleteTask(taskID, context);
              //       Navigator.of(context).pop();
              //     },
              //     child: const Text('削除する')),
            ],
          )),
        ));
  }
}

// void main() => runApp(MyApp());

Widget _pageTitle(String taskID) {
  if (taskID == '') {
    return Text('Add Task');
  } else {
    return Text('Task Detail');
  }
}

class SupplierChoices extends ConsumerWidget {
  const SupplierChoices({Key? key}) : super(key: key);

  // var _choiceIndex = ref.read(choiceIndexProvider.notifier).state;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskTitle = ref.watch(choiceIndexProvider);
    return Wrap(
      spacing: 10,
      children: [
        for (int i = 0; i < supplierList.length; i++)
          ChoiceChip(
            labelStyle: TextStyle(color: Colors.white),
            label: Text(supplierList[i]),
            selected: ref.read(choiceIndexProvider.notifier).state == i,
            selectedColor: Colors.lightBlue,
            backgroundColor: Colors.grey,
            onSelected: (_) {
              ref.read(choiceIndexProvider.notifier).state = i;
            },
            showCheckmark: false,
          ),
      ],
    );
  }
}

Widget _buttons(String taskID, DataService dataService, TextEditingController taskTitle, TextEditingController taskBody, BuildContext context) {
  if (taskID == '') {
    return ElevatedButton(
        onPressed: () async {
          dataService.addTask(taskTitle.text, taskBody.text, 'status', 'supplier', context);
          Navigator.of(context).pop();
          // Navigator.of(context).push(
          // MaterialPageRoute(builder: (context) => const TaskBoard()));
        },
        child: const Text('追加する'));
  } else {
    return Column(children: [
      ElevatedButton(
          onPressed: () async {
            // データを保存するメソッドを使用する。ボタンを押すと実行される
            dataService.updateTask(taskID, taskTitle.text, taskBody.text, 'status', 'supplier', context);
            // ブログの投稿ページへ画面遷移する
            Navigator.of(context).pop();
            // Navigator.of(context).push(
            // MaterialPageRoute(builder: (context) => const TaskBoard()));
          },
          child: const Text('更新する')),
      const SizedBox(height: 20.0),
      ElevatedButton(
          onPressed: () async {
            dataService.deleteTask(taskID, context);
            Navigator.of(context).pop();
          },
          child: const Text('削除する')),
    ]);
  }
}
