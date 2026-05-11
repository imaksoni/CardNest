import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_domain_model.freezed.dart';
part 'card_domain_model.g.dart';

@freezed

abstract class CardDomainModel with _$CardDomainModel {
  const factory CardDomainModel({
    required String id,
    required String userId,
    required String programId,
    @Default(0) int points,
    String? currentTierId,
    DateTime? localUpdatedAt,
    DateTime? serverUpdatedAt,
    String? syncState,
    String? operationId,
    @Default(false) bool isDeleted,
  }) = _CardDomainModel;

  factory CardDomainModel.fromJson(Map<String, dynamic> json) => _$CardDomainModelFromJson(json);
}
