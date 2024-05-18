import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taskhawk/data_service.dart';
import 'package:taskhawk/views/task_detail.dart';

class UpdateButtons extends ConsumerWidget {
  const UpdateButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskID = ref.read(taskIDProvider.notifier).state;
    final dataService = ref.read(dataServiceProvider.notifier).state;
    final taskTitle = ref.read(taskDetailTitleProvider.notifier).state;
    final taskBody = ref.read(taskDetailBodyProvider.notifier).state;
    final supplier = ref.read(taskDetailSupplierProvider.notifier).state;
    final dueDate = ref.read(taskDetailDueDateProvider.notifier).state;

    ref.watch(taskDetailSupplierProvider);
    String pageType = '';

    if (taskID == '') {
      pageType = 'add';
    } else {
      pageType = 'detail';
    }

    if (pageType == 'add') {
      return ElevatedButton(
          onPressed: () async {
            dataService.addTask(taskTitle.text, taskBody.text, 'status',
                supplier, dueDate.text, context);
            Navigator.of(context).pop();
          },
          child: const Text('追加する'));
    } else {
      return Column(children: [
        ElevatedButton(
            onPressed: () async {
              dataService.updateTask(taskID, taskTitle.text, taskBody.text,
                  'status', supplier, dueDate.text, context);
              Navigator.of(context).pop();
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
}
