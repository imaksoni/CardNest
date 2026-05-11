// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrScanHistoryModel {

 String get id; String get scannerId; String get qrData; DateTime get scanTime; String get status; DateTime? get localUpdatedAt; DateTime? get serverUpdatedAt; String? get syncState; String? get operationId; bool get isDeleted;
/// Create a copy of QrScanHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrScanHistoryModelCopyWith<QrScanHistoryModel> get copyWith => _$QrScanHistoryModelCopyWithImpl<QrScanHistoryModel>(this as QrScanHistoryModel, _$identity);

  /// Serializes this QrScanHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrScanHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.scannerId, scannerId) || other.scannerId == scannerId)&&(identical(other.qrData, qrData) || other.qrData == qrData)&&(identical(other.scanTime, scanTime) || other.scanTime == scanTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scannerId,qrData,scanTime,status,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'QrScanHistoryModel(id: $id, scannerId: $scannerId, qrData: $qrData, scanTime: $scanTime, status: $status, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $QrScanHistoryModelCopyWith<$Res>  {
  factory $QrScanHistoryModelCopyWith(QrScanHistoryModel value, $Res Function(QrScanHistoryModel) _then) = _$QrScanHistoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String scannerId, String qrData, DateTime scanTime, String status, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class _$QrScanHistoryModelCopyWithImpl<$Res>
    implements $QrScanHistoryModelCopyWith<$Res> {
  _$QrScanHistoryModelCopyWithImpl(this._self, this._then);

  final QrScanHistoryModel _self;
  final $Res Function(QrScanHistoryModel) _then;

/// Create a copy of QrScanHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scannerId = null,Object? qrData = null,Object? scanTime = null,Object? status = null,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scannerId: null == scannerId ? _self.scannerId : scannerId // ignore: cast_nullable_to_non_nullable
as String,qrData: null == qrData ? _self.qrData : qrData // ignore: cast_nullable_to_non_nullable
as String,scanTime: null == scanTime ? _self.scanTime : scanTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,localUpdatedAt: freezed == localUpdatedAt ? _self.localUpdatedAt : localUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,serverUpdatedAt: freezed == serverUpdatedAt ? _self.serverUpdatedAt : serverUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: freezed == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as String?,operationId: freezed == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QrScanHistoryModel].
extension QrScanHistoryModelPatterns on QrScanHistoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrScanHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrScanHistoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrScanHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _QrScanHistoryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrScanHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _QrScanHistoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String scannerId,  String qrData,  DateTime scanTime,  String status,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrScanHistoryModel() when $default != null:
return $default(_that.id,_that.scannerId,_that.qrData,_that.scanTime,_that.status,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String scannerId,  String qrData,  DateTime scanTime,  String status,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)  $default,) {final _that = this;
switch (_that) {
case _QrScanHistoryModel():
return $default(_that.id,_that.scannerId,_that.qrData,_that.scanTime,_that.status,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String scannerId,  String qrData,  DateTime scanTime,  String status,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _QrScanHistoryModel() when $default != null:
return $default(_that.id,_that.scannerId,_that.qrData,_that.scanTime,_that.status,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrScanHistoryModel implements QrScanHistoryModel {
  const _QrScanHistoryModel({required this.id, required this.scannerId, required this.qrData, required this.scanTime, required this.status, this.localUpdatedAt, this.serverUpdatedAt, this.syncState, this.operationId, this.isDeleted = false});
  factory _QrScanHistoryModel.fromJson(Map<String, dynamic> json) => _$QrScanHistoryModelFromJson(json);

@override final  String id;
@override final  String scannerId;
@override final  String qrData;
@override final  DateTime scanTime;
@override final  String status;
@override final  DateTime? localUpdatedAt;
@override final  DateTime? serverUpdatedAt;
@override final  String? syncState;
@override final  String? operationId;
@override@JsonKey() final  bool isDeleted;

/// Create a copy of QrScanHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrScanHistoryModelCopyWith<_QrScanHistoryModel> get copyWith => __$QrScanHistoryModelCopyWithImpl<_QrScanHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrScanHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrScanHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.scannerId, scannerId) || other.scannerId == scannerId)&&(identical(other.qrData, qrData) || other.qrData == qrData)&&(identical(other.scanTime, scanTime) || other.scanTime == scanTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scannerId,qrData,scanTime,status,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'QrScanHistoryModel(id: $id, scannerId: $scannerId, qrData: $qrData, scanTime: $scanTime, status: $status, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$QrScanHistoryModelCopyWith<$Res> implements $QrScanHistoryModelCopyWith<$Res> {
  factory _$QrScanHistoryModelCopyWith(_QrScanHistoryModel value, $Res Function(_QrScanHistoryModel) _then) = __$QrScanHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String scannerId, String qrData, DateTime scanTime, String status, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class __$QrScanHistoryModelCopyWithImpl<$Res>
    implements _$QrScanHistoryModelCopyWith<$Res> {
  __$QrScanHistoryModelCopyWithImpl(this._self, this._then);

  final _QrScanHistoryModel _self;
  final $Res Function(_QrScanHistoryModel) _then;

/// Create a copy of QrScanHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scannerId = null,Object? qrData = null,Object? scanTime = null,Object? status = null,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_QrScanHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scannerId: null == scannerId ? _self.scannerId : scannerId // ignore: cast_nullable_to_non_nullable
as String,qrData: null == qrData ? _self.qrData : qrData // ignore: cast_nullable_to_non_nullable
as String,scanTime: null == scanTime ? _self.scanTime : scanTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,localUpdatedAt: freezed == localUpdatedAt ? _self.localUpdatedAt : localUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,serverUpdatedAt: freezed == serverUpdatedAt ? _self.serverUpdatedAt : serverUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: freezed == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as String?,operationId: freezed == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
