import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskhawk/data_service.dart';
import 'package:taskhawk/views/task_board.dart';

final taskIDProvider = StateProvider((ref) => ''); 
final testProvider = StateProvider((ref) => ''); 
// final taskDetailtitleProvider = StateProvider.autoDispose((ref) => TextEditingController(text: ref.read(testProvider)));
final taskDetailtitleProvider = StateProvider((ref) => TextEditingController(text: ''));
final taskDetailbodyProvider = StateProvider.autoDispose((ref) => TextEditingController(text: ''));

class taskDetailPage extends ConsumerWidget {
  const taskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(ref.read(testProvider).length);
    // ログアウトに必要なメソッドを呼び出す
    // final authController = ref.read(authAsyncNotifierController.notifier);

    final taskID = ref.read(taskIDProvider);
    final taskTitle = ref.watch(taskDetailtitleProvider);
    final taskBody = ref.watch(taskDetailbodyProvider);

    final dataService = ref.read(dataServiceProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                // ログアウトするメソッド
                // authController.signOutAnonymously(context);
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text('Task Detail'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: taskTitle,
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: taskBody,
          ),
          const SizedBox(height: 20.0),
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
        ],
      )),
    );
  }
}

// void main() => runApp(MyApp());
