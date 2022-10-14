// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductInfo _$$_ProductInfoFromJson(Map<String, dynamic> json) =>
    _$_ProductInfo(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isin: json['isin'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      contractSize: (json['contractSize'] as num?)?.toDouble() ?? 0,
      productType: json['productType'] as String? ?? '',
      productTypeId: json['productTypeId'] as int? ?? 0,
      tradable: json['tradable'] as bool? ?? false,
      category: json['category'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      exchangeId: json['exchangeId'] as String? ?? '',
      onlyEodPrices: json['onlyEodPrices'] as bool? ?? false,
      closePrice: (json['closePrice'] as num?)?.toDouble() ?? 0,
      closePriceDate: json['closePriceDate'] == null
          ? null
          : DateTime.parse(json['closePriceDate'] as String),
    );

Map<String, dynamic> _$$_ProductInfoToJson(_$_ProductInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isin': instance.isin,
      'symbol': instance.symbol,
      'contractSize': instance.contractSize,
      'productType': instance.productType,
      'productTypeId': instance.productTypeId,
      'tradable': instance.tradable,
      'category': instance.category,
      'currency': instance.currency,
      'active': instance.active,
      'exchangeId': instance.exchangeId,
      'onlyEodPrices': instance.onlyEodPrices,
      'closePrice': instance.closePrice,
      'closePriceDate': instance.closePriceDate?.toIso8601String(),
    };
