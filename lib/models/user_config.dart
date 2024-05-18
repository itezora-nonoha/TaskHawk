import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskhawk/models/timestamp.dart';

part 'user_config.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'user_config.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class UserConfig with _$UserConfig {
  const factory UserConfig({
    required String uid,
    required List<String> supplierList,
    @TimestampConverter() DateTime? createdAt,
  }) = _UserConfig;

  factory UserConfig.fromJson(Map<String, dynamic> json) =>
      _$UserConfigFromJson(json);
}
