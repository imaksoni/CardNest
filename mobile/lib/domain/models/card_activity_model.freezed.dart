// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardActivityModel {

 String get id; String get cardId; int get pointsAdded; String? get description; DateTime get timestamp; DateTime? get localUpdatedAt; DateTime? get serverUpdatedAt; String? get syncState; String? get operationId; bool get isDeleted;
/// Create a copy of CardActivityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardActivityModelCopyWith<CardActivityModel> get copyWith => _$CardActivityModelCopyWithImpl<CardActivityModel>(this as CardActivityModel, _$identity);

  /// Serializes this CardActivityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardActivityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.pointsAdded, pointsAdded) || other.pointsAdded == pointsAdded)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cardId,pointsAdded,description,timestamp,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'CardActivityModel(id: $id, cardId: $cardId, pointsAdded: $pointsAdded, description: $description, timestamp: $timestamp, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $CardActivityModelCopyWith<$Res>  {
  factory $CardActivityModelCopyWith(CardActivityModel value, $Res Function(CardActivityModel) _then) = _$CardActivityModelCopyWithImpl;
@useResult
$Res call({
 String id, String cardId, int pointsAdded, String? description, DateTime timestamp, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class _$CardActivityModelCopyWithImpl<$Res>
    implements $CardActivityModelCopyWith<$Res> {
  _$CardActivityModelCopyWithImpl(this._self, this._then);

  final CardActivityModel _self;
  final $Res Function(CardActivityModel) _then;

/// Create a copy of CardActivityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cardId = null,Object? pointsAdded = null,Object? description = freezed,Object? timestamp = null,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,pointsAdded: null == pointsAdded ? _self.pointsAdded : pointsAdded // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,localUpdatedAt: freezed == localUpdatedAt ? _self.localUpdatedAt : localUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,serverUpdatedAt: freezed == serverUpdatedAt ? _self.serverUpdatedAt : serverUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: freezed == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as String?,operationId: freezed == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CardActivityModel].
extension CardActivityModelPatterns on CardActivityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardActivityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardActivityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardActivityModel value)  $default,){
final _that = this;
switch (_that) {
case _CardActivityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardActivityModel value)?  $default,){
final _that = this;
switch (_that) {
case _CardActivityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String cardId,  int pointsAdded,  String? description,  DateTime timestamp,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardActivityModel() when $default != null:
return $default(_that.id,_that.cardId,_that.pointsAdded,_that.description,_that.timestamp,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String cardId,  int pointsAdded,  String? description,  DateTime timestamp,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)  $default,) {final _that = this;
switch (_that) {
case _CardActivityModel():
return $default(_that.id,_that.cardId,_that.pointsAdded,_that.description,_that.timestamp,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String cardId,  int pointsAdded,  String? description,  DateTime timestamp,  DateTime? localUpdatedAt,  DateTime? serverUpdatedAt,  String? syncState,  String? operationId,  bool isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _CardActivityModel() when $default != null:
return $default(_that.id,_that.cardId,_that.pointsAdded,_that.description,_that.timestamp,_that.localUpdatedAt,_that.serverUpdatedAt,_that.syncState,_that.operationId,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardActivityModel implements CardActivityModel {
  const _CardActivityModel({required this.id, required this.cardId, required this.pointsAdded, this.description, required this.timestamp, this.localUpdatedAt, this.serverUpdatedAt, this.syncState, this.operationId, this.isDeleted = false});
  factory _CardActivityModel.fromJson(Map<String, dynamic> json) => _$CardActivityModelFromJson(json);

@override final  String id;
@override final  String cardId;
@override final  int pointsAdded;
@override final  String? description;
@override final  DateTime timestamp;
@override final  DateTime? localUpdatedAt;
@override final  DateTime? serverUpdatedAt;
@override final  String? syncState;
@override final  String? operationId;
@override@JsonKey() final  bool isDeleted;

/// Create a copy of CardActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardActivityModelCopyWith<_CardActivityModel> get copyWith => __$CardActivityModelCopyWithImpl<_CardActivityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardActivityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardActivityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.pointsAdded, pointsAdded) || other.pointsAdded == pointsAdded)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.localUpdatedAt, localUpdatedAt) || other.localUpdatedAt == localUpdatedAt)&&(identical(other.serverUpdatedAt, serverUpdatedAt) || other.serverUpdatedAt == serverUpdatedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.operationId, operationId) || other.operationId == operationId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cardId,pointsAdded,description,timestamp,localUpdatedAt,serverUpdatedAt,syncState,operationId,isDeleted);

@override
String toString() {
  return 'CardActivityModel(id: $id, cardId: $cardId, pointsAdded: $pointsAdded, description: $description, timestamp: $timestamp, localUpdatedAt: $localUpdatedAt, serverUpdatedAt: $serverUpdatedAt, syncState: $syncState, operationId: $operationId, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$CardActivityModelCopyWith<$Res> implements $CardActivityModelCopyWith<$Res> {
  factory _$CardActivityModelCopyWith(_CardActivityModel value, $Res Function(_CardActivityModel) _then) = __$CardActivityModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String cardId, int pointsAdded, String? description, DateTime timestamp, DateTime? localUpdatedAt, DateTime? serverUpdatedAt, String? syncState, String? operationId, bool isDeleted
});




}
/// @nodoc
class __$CardActivityModelCopyWithImpl<$Res>
    implements _$CardActivityModelCopyWith<$Res> {
  __$CardActivityModelCopyWithImpl(this._self, this._then);

  final _CardActivityModel _self;
  final $Res Function(_CardActivityModel) _then;

/// Create a copy of CardActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cardId = null,Object? pointsAdded = null,Object? description = freezed,Object? timestamp = null,Object? localUpdatedAt = freezed,Object? serverUpdatedAt = freezed,Object? syncState = freezed,Object? operationId = freezed,Object? isDeleted = null,}) {
  return _then(_CardActivityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,pointsAdded: null == pointsAdded ? _self.pointsAdded : pointsAdded // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,localUpdatedAt: freezed == localUpdatedAt ? _self.localUpdatedAt : localUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,serverUpdatedAt: freezed == serverUpdatedAt ? _self.serverUpdatedAt : serverUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: freezed == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as String?,operationId: freezed == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
