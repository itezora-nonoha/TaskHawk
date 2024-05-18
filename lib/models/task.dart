import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskhawk/models/timestamp.dart';

part 'task.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'task.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required String body,
    required String status,
    required String supplier,
    required String dueDate,
    required String createUser,
    @TimestampConverter() DateTime? createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
