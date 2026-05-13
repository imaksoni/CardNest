// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrScanRequest {

 String get qrToken;
/// Create a copy of QrScanRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrScanRequestCopyWith<QrScanRequest> get copyWith => _$QrScanRequestCopyWithImpl<QrScanRequest>(this as QrScanRequest, _$identity);

  /// Serializes this QrScanRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrScanRequest&&(identical(other.qrToken, qrToken) || other.qrToken == qrToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrToken);

@override
String toString() {
  return 'QrScanRequest(qrToken: $qrToken)';
}


}

/// @nodoc
abstract mixin class $QrScanRequestCopyWith<$Res>  {
  factory $QrScanRequestCopyWith(QrScanRequest value, $Res Function(QrScanRequest) _then) = _$QrScanRequestCopyWithImpl;
@useResult
$Res call({
 String qrToken
});




}
/// @nodoc
class _$QrScanRequestCopyWithImpl<$Res>
    implements $QrScanRequestCopyWith<$Res> {
  _$QrScanRequestCopyWithImpl(this._self, this._then);

  final QrScanRequest _self;
  final $Res Function(QrScanRequest) _then;

/// Create a copy of QrScanRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qrToken = null,}) {
  return _then(_self.copyWith(
qrToken: null == qrToken ? _self.qrToken : qrToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QrScanRequest].
extension QrScanRequestPatterns on QrScanRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrScanRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrScanRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrScanRequest value)  $default,){
final _that = this;
switch (_that) {
case _QrScanRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrScanRequest value)?  $default,){
final _that = this;
switch (_that) {
case _QrScanRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String qrToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrScanRequest() when $default != null:
return $default(_that.qrToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String qrToken)  $default,) {final _that = this;
switch (_that) {
case _QrScanRequest():
return $default(_that.qrToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String qrToken)?  $default,) {final _that = this;
switch (_that) {
case _QrScanRequest() when $default != null:
return $default(_that.qrToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrScanRequest implements QrScanRequest {
  const _QrScanRequest({required this.qrToken});
  factory _QrScanRequest.fromJson(Map<String, dynamic> json) => _$QrScanRequestFromJson(json);

@override final  String qrToken;

/// Create a copy of QrScanRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrScanRequestCopyWith<_QrScanRequest> get copyWith => __$QrScanRequestCopyWithImpl<_QrScanRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrScanRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrScanRequest&&(identical(other.qrToken, qrToken) || other.qrToken == qrToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrToken);

@override
String toString() {
  return 'QrScanRequest(qrToken: $qrToken)';
}


}

/// @nodoc
abstract mixin class _$QrScanRequestCopyWith<$Res> implements $QrScanRequestCopyWith<$Res> {
  factory _$QrScanRequestCopyWith(_QrScanRequest value, $Res Function(_QrScanRequest) _then) = __$QrScanRequestCopyWithImpl;
@override @useResult
$Res call({
 String qrToken
});




}
/// @nodoc
class __$QrScanRequestCopyWithImpl<$Res>
    implements _$QrScanRequestCopyWith<$Res> {
  __$QrScanRequestCopyWithImpl(this._self, this._then);

  final _QrScanRequest _self;
  final $Res Function(_QrScanRequest) _then;

/// Create a copy of QrScanRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qrToken = null,}) {
  return _then(_QrScanRequest(
qrToken: null == qrToken ? _self.qrToken : qrToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
