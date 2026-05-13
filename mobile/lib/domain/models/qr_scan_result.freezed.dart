// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrScanResult {

 String get status; String? get message; String? get userName; String? get businessName; String? get cardNumber; String? get tierName; int? get points; DateTime? get expiry; DateTime? get validatedAt;
/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrScanResultCopyWith<QrScanResult> get copyWith => _$QrScanResultCopyWithImpl<QrScanResult>(this as QrScanResult, _$identity);

  /// Serializes this QrScanResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrScanResult&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.tierName, tierName) || other.tierName == tierName)&&(identical(other.points, points) || other.points == points)&&(identical(other.expiry, expiry) || other.expiry == expiry)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,userName,businessName,cardNumber,tierName,points,expiry,validatedAt);

@override
String toString() {
  return 'QrScanResult(status: $status, message: $message, userName: $userName, businessName: $businessName, cardNumber: $cardNumber, tierName: $tierName, points: $points, expiry: $expiry, validatedAt: $validatedAt)';
}


}

/// @nodoc
abstract mixin class $QrScanResultCopyWith<$Res>  {
  factory $QrScanResultCopyWith(QrScanResult value, $Res Function(QrScanResult) _then) = _$QrScanResultCopyWithImpl;
@useResult
$Res call({
 String status, String? message, String? userName, String? businessName, String? cardNumber, String? tierName, int? points, DateTime? expiry, DateTime? validatedAt
});




}
/// @nodoc
class _$QrScanResultCopyWithImpl<$Res>
    implements $QrScanResultCopyWith<$Res> {
  _$QrScanResultCopyWithImpl(this._self, this._then);

  final QrScanResult _self;
  final $Res Function(QrScanResult) _then;

/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = freezed,Object? userName = freezed,Object? businessName = freezed,Object? cardNumber = freezed,Object? tierName = freezed,Object? points = freezed,Object? expiry = freezed,Object? validatedAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,tierName: freezed == tierName ? _self.tierName : tierName // ignore: cast_nullable_to_non_nullable
as String?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as DateTime?,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QrScanResult].
extension QrScanResultPatterns on QrScanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrScanResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrScanResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrScanResult value)  $default,){
final _that = this;
switch (_that) {
case _QrScanResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrScanResult value)?  $default,){
final _that = this;
switch (_that) {
case _QrScanResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String? message,  String? userName,  String? businessName,  String? cardNumber,  String? tierName,  int? points,  DateTime? expiry,  DateTime? validatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrScanResult() when $default != null:
return $default(_that.status,_that.message,_that.userName,_that.businessName,_that.cardNumber,_that.tierName,_that.points,_that.expiry,_that.validatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String? message,  String? userName,  String? businessName,  String? cardNumber,  String? tierName,  int? points,  DateTime? expiry,  DateTime? validatedAt)  $default,) {final _that = this;
switch (_that) {
case _QrScanResult():
return $default(_that.status,_that.message,_that.userName,_that.businessName,_that.cardNumber,_that.tierName,_that.points,_that.expiry,_that.validatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String? message,  String? userName,  String? businessName,  String? cardNumber,  String? tierName,  int? points,  DateTime? expiry,  DateTime? validatedAt)?  $default,) {final _that = this;
switch (_that) {
case _QrScanResult() when $default != null:
return $default(_that.status,_that.message,_that.userName,_that.businessName,_that.cardNumber,_that.tierName,_that.points,_that.expiry,_that.validatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrScanResult implements QrScanResult {
  const _QrScanResult({required this.status, this.message, this.userName, this.businessName, this.cardNumber, this.tierName, this.points, this.expiry, this.validatedAt});
  factory _QrScanResult.fromJson(Map<String, dynamic> json) => _$QrScanResultFromJson(json);

@override final  String status;
@override final  String? message;
@override final  String? userName;
@override final  String? businessName;
@override final  String? cardNumber;
@override final  String? tierName;
@override final  int? points;
@override final  DateTime? expiry;
@override final  DateTime? validatedAt;

/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrScanResultCopyWith<_QrScanResult> get copyWith => __$QrScanResultCopyWithImpl<_QrScanResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrScanResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrScanResult&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.tierName, tierName) || other.tierName == tierName)&&(identical(other.points, points) || other.points == points)&&(identical(other.expiry, expiry) || other.expiry == expiry)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,userName,businessName,cardNumber,tierName,points,expiry,validatedAt);

@override
String toString() {
  return 'QrScanResult(status: $status, message: $message, userName: $userName, businessName: $businessName, cardNumber: $cardNumber, tierName: $tierName, points: $points, expiry: $expiry, validatedAt: $validatedAt)';
}


}

/// @nodoc
abstract mixin class _$QrScanResultCopyWith<$Res> implements $QrScanResultCopyWith<$Res> {
  factory _$QrScanResultCopyWith(_QrScanResult value, $Res Function(_QrScanResult) _then) = __$QrScanResultCopyWithImpl;
@override @useResult
$Res call({
 String status, String? message, String? userName, String? businessName, String? cardNumber, String? tierName, int? points, DateTime? expiry, DateTime? validatedAt
});




}
/// @nodoc
class __$QrScanResultCopyWithImpl<$Res>
    implements _$QrScanResultCopyWith<$Res> {
  __$QrScanResultCopyWithImpl(this._self, this._then);

  final _QrScanResult _self;
  final $Res Function(_QrScanResult) _then;

/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = freezed,Object? userName = freezed,Object? businessName = freezed,Object? cardNumber = freezed,Object? tierName = freezed,Object? points = freezed,Object? expiry = freezed,Object? validatedAt = freezed,}) {
  return _then(_QrScanResult(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,tierName: freezed == tierName ? _self.tierName : tierName // ignore: cast_nullable_to_non_nullable
as String?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as DateTime?,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
