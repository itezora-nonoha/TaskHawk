import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskhawk/repository/task_provider.dart';
import 'package:taskhawk/views/add_task.dart';
import 'package:taskhawk/views/task_detail.dart';

class TaskBoard extends ConsumerWidget {
  const TaskBoard({Key? key}) : super(key: key);

  void _onTapTask(String taskID) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // blogコレクションのデータを全て取得する
    final taskData = ref.watch(taskStreamProvider);

    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          title: const Text('Task Board'),
        ),
        body: taskData.when(
            // データを読み込んでいるとローディングの処理がされる
            loading: () => const CircularProgressIndicator(),
            // エラーが発生するとエラーが表示される
            error: (error, stack) => Text('Error: $error'),
            // Streamで取得したデータが表示される
            data: (taskData) {
              return ListView.builder(
                  itemCount: taskData.length,
                  itemBuilder: (context, index) {
                    final task = taskData[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.body),
                      // subtitle: Text('test'),
                      onTap: () {
                        // final titleController = ref.read(taskDetailtitleProvider.notifier);
                        // ref.read(testProvider.notifier).state = task.title;
                        ref.read(taskIDProvider.notifier).state = task.id;
                        ref.read(taskDetailtitleProvider.notifier).state =
                            TextEditingController(text: task.title);
                        ref.read(taskDetailbodyProvider.notifier).state =
                            TextEditingController(text: task.body);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskDetailPage()));
                      },
                      // onTap: () => _onTapTask(task.id),
                      // onTap: (() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text('OnTapped: ${index} ${task.id}'),
                      //   duration: const Duration(seconds: 1),
                      // ))),
                    );
                  });
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(taskIDProvider.notifier).state = '';
            ref.read(taskDetailtitleProvider.notifier).state =
                TextEditingController(text: '');
            ref.read(taskDetailbodyProvider.notifier).state =
                TextEditingController(text: '');
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => AddTaskPage()),
              MaterialPageRoute(builder: (context) => TaskDetailPage()),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
