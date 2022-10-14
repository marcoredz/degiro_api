// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashMovementBalance _$CashMovementBalanceFromJson(Map<String, dynamic> json) =>
    CashMovementBalance(
      unsettledCash: (json['unsettledCash'] as num?)?.toDouble() ?? 0,
      flatexCash: (json['flatexCash'] as num?)?.toDouble() ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$CashMovementBalanceToJson(
        CashMovementBalance instance) =>
    <String, dynamic>{
      'unsettledCash': instance.unsettledCash,
      'flatexCash': instance.flatexCash,
      'total': instance.total,
    };

_$_CashMovement _$$_CashMovementFromJson(Map<String, dynamic> json) =>
    _$_CashMovement(
      date: DateTime.parse(json['date'] as String),
      valueDate: DateTime.parse(json['valueDate'] as String),
      id: json['id'] as int? ?? invalidIntValue,
      productId: json['productId'] as int? ?? invalidIntValue,
      orderdId: json['orderdId'] as String?,
      description: json['description'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      change: (json['change'] as num?)?.toDouble() ?? 0,
      balance: json['balance'] == null
          ? null
          : CashMovementBalance.fromJson(
              json['balance'] as Map<String, dynamic>),
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$_CashMovementToJson(_$_CashMovement instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'valueDate': instance.valueDate.toIso8601String(),
      'id': instance.id,
      'productId': instance.productId,
      'orderdId': instance.orderdId,
      'description': instance.description,
      'currency': instance.currency,
      'change': instance.change,
      'balance': instance.balance,
      'type': instance.type,
    };
