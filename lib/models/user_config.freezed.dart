// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserConfig _$UserConfigFromJson(Map<String, dynamic> json) {
  return _UserConfig.fromJson(json);
}

/// @nodoc
mixin _$UserConfig {
  String get uid => throw _privateConstructorUsedError;
  List<String> get supplierList => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserConfigCopyWith<UserConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserConfigCopyWith<$Res> {
  factory $UserConfigCopyWith(
          UserConfig value, $Res Function(UserConfig) then) =
      _$UserConfigCopyWithImpl<$Res, UserConfig>;
  @useResult
  $Res call(
      {String uid,
      List<String> supplierList,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$UserConfigCopyWithImpl<$Res, $Val extends UserConfig>
    implements $UserConfigCopyWith<$Res> {
  _$UserConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? supplierList = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      supplierList: null == supplierList
          ? _value.supplierList
          : supplierList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserConfigImplCopyWith<$Res>
    implements $UserConfigCopyWith<$Res> {
  factory _$$UserConfigImplCopyWith(
          _$UserConfigImpl value, $Res Function(_$UserConfigImpl) then) =
      __$$UserConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      List<String> supplierList,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$UserConfigImplCopyWithImpl<$Res>
    extends _$UserConfigCopyWithImpl<$Res, _$UserConfigImpl>
    implements _$$UserConfigImplCopyWith<$Res> {
  __$$UserConfigImplCopyWithImpl(
      _$UserConfigImpl _value, $Res Function(_$UserConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? supplierList = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserConfigImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      supplierList: null == supplierList
          ? _value._supplierList
          : supplierList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserConfigImpl implements _UserConfig {
  const _$UserConfigImpl(
      {required this.uid,
      required final List<String> supplierList,
      @TimestampConverter() this.createdAt})
      : _supplierList = supplierList;

  factory _$UserConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserConfigImplFromJson(json);

  @override
  final String uid;
  final List<String> _supplierList;
  @override
  List<String> get supplierList {
    if (_supplierList is EqualUnmodifiableListView) return _supplierList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supplierList);
  }

  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserConfig(uid: $uid, supplierList: $supplierList, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserConfigImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality()
                .equals(other._supplierList, _supplierList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid,
      const DeepCollectionEquality().hash(_supplierList), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserConfigImplCopyWith<_$UserConfigImpl> get copyWith =>
      __$$UserConfigImplCopyWithImpl<_$UserConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserConfigImplToJson(
      this,
    );
  }
}

abstract class _UserConfig implements UserConfig {
  const factory _UserConfig(
      {required final String uid,
      required final List<String> supplierList,
      @TimestampConverter() final DateTime? createdAt}) = _$UserConfigImpl;

  factory _UserConfig.fromJson(Map<String, dynamic> json) =
      _$UserConfigImpl.fromJson;

  @override
  String get uid;
  @override
  List<String> get supplierList;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserConfigImplCopyWith<_$UserConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
