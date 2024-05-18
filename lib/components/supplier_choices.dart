import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taskhawk/views/task_detail.dart';
import 'package:taskhawk/repository/config_provider.dart';

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
