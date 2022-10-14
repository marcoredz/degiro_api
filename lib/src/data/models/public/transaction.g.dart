// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as int? ?? invalidIntValue,
      productId: json['productId'] as int? ?? invalidIntValue,
      productInfo: json['productInfo'] == null
          ? null
          : ProductInfo.fromJson(json['productInfo'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      buysell: json['buysell'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0,
      orderTypeId: json['orderTypeId'] as int? ?? 0,
      counterParty: json['counterParty'] as String? ?? '',
      transfered: json['transfered'] as bool? ?? false,
      fxRate: (json['fxRate'] as num?)?.toDouble() ?? 0,
      nettFxRate: (json['nettFxRate'] as num?)?.toDouble() ?? 0,
      grossFxRate: (json['grossFxRate'] as num?)?.toDouble() ?? 0,
      autoFxFeeInBaseCurrency:
          (json['autoFxFeeInBaseCurrency'] as num?)?.toDouble() ?? 0,
      totalInBaseCurrency:
          (json['totalInBaseCurrency'] as num?)?.toDouble() ?? 0,
      feeInBaseCurrency: (json['feeInBaseCurrency'] as num?)?.toDouble() ?? 0,
      totalFeesInBaseCurrency:
          (json['totalFeesInBaseCurrency'] as num?)?.toDouble() ?? 0,
      totalPlusFeeInBaseCurrency:
          (json['totalPlusFeeInBaseCurrency'] as num?)?.toDouble() ?? 0,
      totalPlusAllFeesInBaseCurrency:
          (json['totalPlusAllFeesInBaseCurrency'] as num?)?.toDouble() ?? 0,
      transactionTypeId: json['transactionTypeId'] as int? ?? 0,
      tradingVenue: json['tradingVenue'] as String? ?? '',
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productInfo': instance.productInfo,
      'date': instance.date.toIso8601String(),
      'buysell': instance.buysell,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'orderTypeId': instance.orderTypeId,
      'counterParty': instance.counterParty,
      'transfered': instance.transfered,
      'fxRate': instance.fxRate,
      'nettFxRate': instance.nettFxRate,
      'grossFxRate': instance.grossFxRate,
      'autoFxFeeInBaseCurrency': instance.autoFxFeeInBaseCurrency,
      'totalInBaseCurrency': instance.totalInBaseCurrency,
      'feeInBaseCurrency': instance.feeInBaseCurrency,
      'totalFeesInBaseCurrency': instance.totalFeesInBaseCurrency,
      'totalPlusFeeInBaseCurrency': instance.totalPlusFeeInBaseCurrency,
      'totalPlusAllFeesInBaseCurrency': instance.totalPlusAllFeesInBaseCurrency,
      'transactionTypeId': instance.transactionTypeId,
      'tradingVenue': instance.tradingVenue,
    };
