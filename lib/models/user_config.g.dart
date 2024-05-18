// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserConfigImpl _$$UserConfigImplFromJson(Map<String, dynamic> json) =>
    _$UserConfigImpl(
      uid: json['uid'] as String,
      supplierList: (json['supplierList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$UserConfigImplToJson(_$UserConfigImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'supplierList': instance.supplierList,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
