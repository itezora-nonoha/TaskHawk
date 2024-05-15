import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskhawk/models/task.dart';

final dataServiceProvider = StateProvider<DataService>((ref) => DataService());

class DataService {
  
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  
  // Firestoreにデータを保存するメソッド
  Future<void> addTask(String title, String body, String status, String supplier, BuildContext context) async {
    try {
      if (title.isEmpty) {
        throw ('タイトルが入力されていません!');
      }

      if (body.isEmpty) {
        throw ('投稿内容が入力されていません!');
      }

      // uid取得する変数
      final taskID = DateTime.now().toIso8601String();
      final userID = auth.currentUser?.uid;
      // Freezedのモデルクラスで定義した型を使ってデータを保存する
      final newTask = Task(
          id: taskID,
          title: title,
          body: body,
          status: status,
          supplier: supplier,
          createUser: userID.toString(),
          createdAt: DateTime.now());

      await db.collection('tasks').doc(taskID).set(newTask.toJson());
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // throwのエラーメッセージがダイアログで表示される.
              title: Text(e.toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  
  // Firestoreにデータを保存するメソッド
  Future<void> updateTask(String taskID, String title, String body, String status, String supplier, BuildContext context) async {
    try {
      // uid取得する変数
      final userID = auth.currentUser?.uid;
      // Freezedのモデルクラスで定義した型を使ってデータを保存する
      final newTask = Task(
          id: taskID,
          title: title,
          body: body,
          status: status,
          supplier: supplier,
          createUser: userID.toString()
          );

      await db.collection('tasks').doc(taskID).update(newTask.toJson());
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // throwのエラーメッセージがダイアログで表示される.
              title: Text(e.toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
