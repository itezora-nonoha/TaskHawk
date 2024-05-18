import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taskhawk/views/task_detail.dart';
import 'package:taskhawk/repository/config_provider.dart';
import 'package:taskhawk/data_service.dart';

class SupplierListPage extends ConsumerWidget {
  const SupplierListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _controllerName = TextEditingController();
    // サプライヤリストを取得
    var userConfigData = ref.watch(userConfigStreamProvider);

    List<String> supplierList = ref.watch(supplierListProvider.notifier).state;

    // ref.watch(choiceIndexProvider.notifier).state;
    // print(userConfigData);
    ref.watch(taskDetailSupplierProvider);
    // final taskTitle = ref.watch(choiceIndexProvider);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          // actions: [
          // IconButton(
          //     onPressed: () async {},
          //     icon: const Icon(Icons.save),
          //     tooltip: 'リストの保存')
          // ],
          title: const Text('Supplier List'),
        ),
        body: userConfigData.when(
            // データを読み込んでいるとローディングの処理がされる
            loading: () => const CircularProgressIndicator(),
            // エラーが発生するとエラーが表示される
            error: (error, stack) => Text('Error: $error'),
            // Streamで取得したデータが表示される
            data: (userConfigData) {
              supplierList = userConfigData[0].supplierList;
              return SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: supplierList.isEmpty
                          ? const Center(child: Text('NO DATA'))
                          : ListView.builder(
                              itemCount: supplierList.length,
                              itemBuilder: (BuildContext context, int index) {
                                final supplier = supplierList[index];
                                return Card(
                                  child: InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              supplier,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          const SizedBox(width: 5, height: 25),
                                          SizedBox(
                                            width: 50,
                                            height: 25,
                                            child: Tooltip(
                                                message: '依頼元会社の削除',
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      var supplierListNew =
                                                          supplierList.toList();
                                                      supplierListNew.remove(
                                                          supplierList[index]);
                                                      _onPressedUpdateButton(
                                                          supplierListNew,
                                                          ref,
                                                          context);
                                                    },
                                                    child: const Icon(
                                                        Icons.delete,
                                                        size: 15))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: _controllerName,
                        autofocus: false,
                        decoration:
                            const InputDecoration(labelText: '追加する依頼元会社名'),
                        onSubmitted: (String value) {
                          // _onPressedAddButton();
                        },
                      )),
                      ElevatedButton(
                          onPressed: () {
                            var supplierListNew = supplierList.toList();
                            supplierListNew.add(_controllerName.text);
                            _onPressedUpdateButton(
                                supplierListNew, ref, context);
                          },
                          child: const Icon(Icons.add)),
                    ],
                  ),
                ],
              ));
            }));
  }

  void _onPressedUpdateButton(
      supplierList, WidgetRef ref, BuildContext context) {
    final dataService = ref.read(dataServiceProvider.notifier).state;
    dataService.updateUserConfig(supplierList, context);
  }
}
