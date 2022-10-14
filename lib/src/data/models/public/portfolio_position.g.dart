// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PortfolioPosition _$$_PortfolioPositionFromJson(Map<String, dynamic> json) =>
    _$_PortfolioPosition(
      id: json['id'] as String,
      productInfo: json['productInfo'] == null
          ? null
          : ProductInfo.fromJson(json['productInfo'] as Map<String, dynamic>),
      positionType: json['positionType'] as String? ?? '',
      size: json['size'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      value: (json['value'] as num?)?.toDouble() ?? 0,
      breakEvenPrice: (json['breakEvenPrice'] as num?)?.toDouble() ?? 0,
      realizedProductPl: (json['realizedProductPl'] as num?)?.toDouble() ?? 0,
      todayRealizedProductPl:
          (json['todayRealizedProductPl'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PortfolioPositionToJson(
        _$_PortfolioPosition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productInfo': instance.productInfo,
      'positionType': instance.positionType,
      'size': instance.size,
      'price': instance.price,
      'value': instance.value,
      'breakEvenPrice': instance.breakEvenPrice,
      'realizedProductPl': instance.realizedProductPl,
      'todayRealizedProductPl': instance.todayRealizedProductPl,
    };
