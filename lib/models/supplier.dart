import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskhawk/models/timestamp.dart';

part 'supplier.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'supplier.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class Supplier with _$Supplier {
  const factory Supplier({
    required String id,
    required String name,
    required String createUser,
    @TimestampConverter() DateTime? createdAt,
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, dynamic> json) => _$SupplierFromJson(json);
}
