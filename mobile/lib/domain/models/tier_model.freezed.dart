// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TierModel {

 String get id; String get programId; String get name; int get pointsRequired; String? get benefits; DateTime? get localUpdatedAt; DateTime? get serverUpdatedAt; String? get syncState; String? get operationId; bool get isDeleted;
/// Create a copy of TierModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TierModelCopyWith<TierModel> get copyWith => _$TierModelCopyWithImpl<TierModel>(this as TierModel, _$identity);

  /// Serializes this TierModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TierModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.name, name) || other.name == name)&&(identical(other.pointsRequired, pointsRequired) || other.pointsRequired == pointsRequired)&&(identical(other.benefits, benefits) || other.benefits == benefits)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programId,name,pointsRequired,benefits,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'TierModel(id: $id, programId: $programId, name: $name, pointsRequired: $pointsRequired, benefits: $benefits, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $TierModelCopyWith<$Res>  {
  factory $TierModelCopyWith(TierModel value, $Res Function(TierModel) _then) = _$TierModelCopyWithImpl;
@useResult
$Res call({
 String id, String programId, String name, int pointsRequired, String? benefits, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class _$TierModelCopyWithImpl<$Res>
    implements $TierModelCopyWith<$Res> {
  _$TierModelCopyWithImpl(this._self, this._then);

  final TierModel _self;
  final $Res Function(TierModel) _then;

/// Create a copy of TierModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? programId = null,Object? name = null,Object? pointsRequired = null,Object? benefits = freezed,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pointsRequired: null == pointsRequired ? _self.pointsRequired : pointsRequired // ignore: cast_nullable_to_non_nullable
as int,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as String?,localUpdatedAt: freezed == localUpdatedAt ? _self.localUpdatedAt : localUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,serverUpdatedAt: freezed == serverUpdatedAt ? _self.serverUpdatedAt : serverUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: freezed == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as String?,operationId: freezed == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TierModel].
extension TierModelPatterns on TierModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TierModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TierModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TierModel value)  $default,){
final _that = this;
switch (_that) {
case _TierModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TierModel value)?  $default,){
final _that = this;
switch (_that) {
case _TierModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String programId,  String name,  int pointsRequired,  String? benefits,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TierModel() when $default != null:
return $default(_that.id,_that.programId,_that.name,_that.pointsRequired,_that.benefits,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String programId,  String name,  int pointsRequired,  String? benefits,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)  $default,) {final _that = this;
switch (_that) {
case _TierModel():
return $default(_that.id,_that.programId,_that.name,_that.pointsRequired,_that.benefits,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String programId,  String name,  int pointsRequired,  String? benefits,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _TierModel() when $default != null:
return $default(_that.id,_that.programId,_that.name,_that.pointsRequired,_that.benefits,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TierModel implements TierModel {
  const _TierModel({required this.id, required this.programId, required this.name, required this.pointsRequired, this.benefits, this.localUpdatedAt, this.serverUpdatedAt, this.syncState, this.operationId, this.isDeleted = false});
  factory _TierModel.fromJson(Map<String, dynamic> json) => _$TierModelFromJson(json);

@override final  String id;
@override final  String programId;
@override final  String name;
@override final  int pointsRequired;
@override final  String? benefits;
@override final  DateTime? localUpdatedAt;
@override final  DateTime? serverUpdatedAt;
@override final  String? syncState;
@override final  String? operationId;
@override@JsonKey() final  bool isDeleted;

/// Create a copy of TierModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TierModelCopyWith<_TierModel> get copyWith => __$TierModelCopyWithImpl<_TierModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TierModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TierModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.name, name) || other.name == name)&&(identical(other.pointsRequired, pointsRequired) || other.pointsRequired == pointsRequired)&&(identical(other.benefits, benefits) || other.benefits == benefits)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programId,name,pointsRequired,benefits,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'TierModel(id: $id, programId: $programId, name: $name, pointsRequired: $pointsRequired, benefits: $benefits, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$TierModelCopyWith<$Res> implements $TierModelCopyWith<$Res> {
  factory _$TierModelCopyWith(_TierModel value, $Res Function(_TierModel) _then) = __$TierModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String programId, String name, int pointsRequired, String? benefits, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class __$TierModelCopyWithImpl<$Res>
    implements _$TierModelCopyWith<$Res> {
  __$TierModelCopyWithImpl(this._self, this._then);

  final _TierModel _self;
  final $Res Function(_TierModel) _then;

/// Create a copy of TierModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? programId = null,Object? name = null,Object? pointsRequired = null,Object? benefits = freezed,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_TierModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pointsRequired: null == pointsRequired ? _self.pointsRequired : pointsRequired // ignore: cast_nullable_to_non_nullable
as int,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as String?,localUpdatedAt: freezed == localUpdatedAt ? _self.localUpdatedAt : localUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,serverUpdatedAt: freezed == serverUpdatedAt ? _self.serverUpdatedAt : serverUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: freezed == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as String?,operationId: freezed == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
