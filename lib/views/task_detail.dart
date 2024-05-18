import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taskhawk/components/update_buttons.dart';
import 'package:taskhawk/repository/config_provider.dart';

final taskIDProvider = StateProvider((ref) => '');
// final choiceIndexProvider = StateProvider((ref) => '');
// final supplierList = ['A社', 'B社', 'C社'];
final supplierListProvider = StateProvider<List<String>>((ref) => ['blank']);
final taskDetailTitleProvider =
    StateProvider((ref) => TextEditingController(text: ''));
final taskDetailBodyProvider =
    StateProvider((ref) => TextEditingController(text: ''));
final taskDetailSupplierProvider = StateProvider((ref) => '');
final taskDetailDueDateProvider =
    StateProvider((ref) => TextEditingController(text: ''));

class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ログアウトに必要なメソッドを呼び出す
    // final authController = ref.read(authAsyncNotifierController.notifier);

    final taskID = ref.read(taskIDProvider);
    final taskTitle = ref.watch(taskDetailTitleProvider);
    final taskBody = ref.watch(taskDetailBodyProvider);
    final taskDueDate = ref.watch(taskDetailDueDateProvider);

    DateTime _date = new DateTime.now();

    // ボタン押下時のイベント
    void onPressedRaisedButton() async {
      String initialDateStr = taskDueDate.text;
      if (initialDateStr == '') {
        initialDateStr = DateTime.now().toString().split(' ')[0];
      }
      final DateTime? picked = await showDatePicker(
          locale: const Locale("ja"),
          context: context,
          initialDate: DateTime.parse(initialDateStr),
          firstDate: new DateTime(2024),
          lastDate: new DateTime.now().add(new Duration(days: 360)));

      if (picked != null) {
        // 日時反映
        ref.read(taskDetailDueDateProvider.notifier).state.text =
            picked.toString().split(' ')[0];
      }
    }

    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          title: _pageTitle(taskID),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: taskTitle,
                  decoration: InputDecoration(labelText: 'Task Name'),
                  enabled: true),
              const SizedBox(height: 20.0),
              TextField(
                controller: taskBody,
                decoration: InputDecoration(labelText: 'Task Detail'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                  controller: taskDueDate,
                  decoration: InputDecoration(labelText: 'Due Date')),
              TextButton(onPressed: onPressedRaisedButton, child: Text('日付選択')),
              const SizedBox(height: 20.0),
              SupplierChoices(),
              const SizedBox(height: 20.0),
              UpdateButtons(),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サプライヤリストを取得
    final userConfigData = ref.watch(userConfigStreamProvider);
    List<String> supplierList = ref.watch(supplierListProvider.notifier).state;
    // ref.watch(choiceIndexProvider.notifier).state;
    // print(userConfigData);
    ref.watch(taskDetailSupplierProvider);
    // final taskTitle = ref.watch(choiceIndexProvider);
    return userConfigData.when(
      // データを読み込んでいるとローディングの処理がされる
      loading: () => const CircularProgressIndicator(),
      // エラーが発生するとエラーが表示される
      error: (error, stack) => Text('Error: $error'),
      // Streamで取得したデータが表示される
      data: (userConfigData) {
        supplierList = userConfigData[0].supplierList;
        return Wrap(spacing: 10, children: [
          for (var supplier in supplierList)
            ChoiceChip(
              labelStyle: TextStyle(color: Colors.white),
              label: Text(supplier),
              selected: ref.read(taskDetailSupplierProvider.notifier).state ==
                  supplier,
              selectedColor: Colors.lightBlue,
              backgroundColor: Colors.grey,
              onSelected: (_) {
                ref.watch(taskDetailSupplierProvider.notifier).state = supplier;
              },
              showCheckmark: false,
            )
        ]);
      },
    );
  }
}
