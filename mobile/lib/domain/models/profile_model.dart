import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed

abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    String? firebaseUid,
    String? email,
    String? displayName,
    String? role,
    DateTime? localUpdatedAt,
    DateTime? serverUpdatedAt,
    String? syncState,
    String? operationId,
    @Default(false) bool isDeleted,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}
