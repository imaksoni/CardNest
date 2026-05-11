// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_domain_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardDomainModel {

 String get id; String get userId; String get programId; int get points; String? get currentTierId; DateTime? get localUpdatedAt; DateTime? get serverUpdatedAt; String? get syncState; String? get operationId; bool get isDeleted;
/// Create a copy of CardDomainModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardDomainModelCopyWith<CardDomainModel> get copyWith => _$CardDomainModelCopyWithImpl<CardDomainModel>(this as CardDomainModel, _$identity);

  /// Serializes this CardDomainModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardDomainModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.points, points) || other.points == points)&&(identical(other.currentTierId, currentTierId) || other.currentTierId == currentTierId)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,programId,points,currentTierId,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'CardDomainModel(id: $id, userId: $userId, programId: $programId, points: $points, currentTierId: $currentTierId, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $CardDomainModelCopyWith<$Res>  {
  factory $CardDomainModelCopyWith(CardDomainModel value, $Res Function(CardDomainModel) _then) = _$CardDomainModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String programId, int points, String? currentTierId, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class _$CardDomainModelCopyWithImpl<$Res>
    implements $CardDomainModelCopyWith<$Res> {
  _$CardDomainModelCopyWithImpl(this._self, this._then);

  final CardDomainModel _self;
  final $Res Function(CardDomainModel) _then;

/// Create a copy of CardDomainModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? programId = null,Object? points = null,Object? currentTierId = freezed,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,currentTierId: freezed == currentTierId ? _self.currentTierId : currentTierId // ignore: cast_nullable_to_non_nullable
as String?,localUpdatedAt: freezed == localUpdatedAt ? _self.localUpdatedAt : localUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,serverUpdatedAt: freezed == serverUpdatedAt ? _self.serverUpdatedAt : serverUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: freezed == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as String?,operationId: freezed == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CardDomainModel].
extension CardDomainModelPatterns on CardDomainModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardDomainModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardDomainModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardDomainModel value)  $default,){
final _that = this;
switch (_that) {
case _CardDomainModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardDomainModel value)?  $default,){
final _that = this;
switch (_that) {
case _CardDomainModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String programId,  int points,  String? currentTierId,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardDomainModel() when $default != null:
return $default(_that.id,_that.userId,_that.programId,_that.points,_that.currentTierId,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String programId,  int points,  String? currentTierId,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)  $default,) {final _that = this;
switch (_that) {
case _CardDomainModel():
return $default(_that.id,_that.userId,_that.programId,_that.points,_that.currentTierId,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String programId,  int points,  String? currentTierId,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _CardDomainModel() when $default != null:
return $default(_that.id,_that.userId,_that.programId,_that.points,_that.currentTierId,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardDomainModel implements CardDomainModel {
  const _CardDomainModel({required this.id, required this.userId, required this.programId, this.points = 0, this.currentTierId, this.localUpdatedAt, this.serverUpdatedAt, this.syncState, this.operationId, this.isDeleted = false});
  factory _CardDomainModel.fromJson(Map<String, dynamic> json) => _$CardDomainModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String programId;
@override@JsonKey() final  int points;
@override final  String? currentTierId;
@override final  DateTime? localUpdatedAt;
@override final  DateTime? serverUpdatedAt;
@override final  String? syncState;
@override final  String? operationId;
@override@JsonKey() final  bool isDeleted;

/// Create a copy of CardDomainModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardDomainModelCopyWith<_CardDomainModel> get copyWith => __$CardDomainModelCopyWithImpl<_CardDomainModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardDomainModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardDomainModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.points, points) || other.points == points)&&(identical(other.currentTierId, currentTierId) || other.currentTierId == currentTierId)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,programId,points,currentTierId,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'CardDomainModel(id: $id, userId: $userId, programId: $programId, points: $points, currentTierId: $currentTierId, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$CardDomainModelCopyWith<$Res> implements $CardDomainModelCopyWith<$Res> {
  factory _$CardDomainModelCopyWith(_CardDomainModel value, $Res Function(_CardDomainModel) _then) = __$CardDomainModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String programId, int points, String? currentTierId, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class __$CardDomainModelCopyWithImpl<$Res>
    implements _$CardDomainModelCopyWith<$Res> {
  __$CardDomainModelCopyWithImpl(this._self, this._then);

  final _CardDomainModel _self;
  final $Res Function(_CardDomainModel) _then;

/// Create a copy of CardDomainModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? programId = null,Object? points = null,Object? currentTierId = freezed,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_CardDomainModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,currentTierId: freezed == currentTierId ? _self.currentTierId : currentTierId // ignore: cast_nullable_to_non_nullable
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
