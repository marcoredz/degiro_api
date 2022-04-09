import 'dart:convert';

import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/public/product_info.dart';

class Transaction {
  int id;
  int productId;
  ProductInfo? productInfo;
  DateTime date;
  String buysell;
  double price;
  int quantity;
  double total;
  int orderTypeId;
  String counterParty;
  bool transfered;
  double fxRate;
  double nettFxRate;
  double grossFxRate;
  double autoFxFeeInBaseCurrency;
  double totalInBaseCurrency;
  double feeInBaseCurrency;
  double totalFeesInBaseCurrency;
  double totalPlusFeeInBaseCurrency;
  double totalPlusAllFeesInBaseCurrency;
  int transactionTypeId; //TODO enum
  String tradingVenue;

  Transaction({
    required this.id,
    required this.productId,
    this.productInfo,
    required this.date,
    required this.buysell,
    required this.price,
    required this.quantity,
    required this.total,
    required this.orderTypeId,
    required this.counterParty,
    required this.transfered,
    required this.fxRate,
    required this.nettFxRate,
    required this.grossFxRate,
    required this.autoFxFeeInBaseCurrency,
    required this.totalInBaseCurrency,
    required this.feeInBaseCurrency,
    required this.totalFeesInBaseCurrency,
    required this.totalPlusFeeInBaseCurrency,
    required this.totalPlusAllFeesInBaseCurrency,
    required this.transactionTypeId,
    required this.tradingVenue,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'].toInt() ?? invalidIntValue,
      productId: map['productId']?.toInt() ?? invalidIntValue,
      productInfo: map['productInfo'] != null ? ProductInfo.fromMap(map['productInfo']) : null,
      date: DateTime.parse(map['date']),
      buysell: map['buysell'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      total: map['total']?.toDouble() ?? 0.0,
      orderTypeId: map['orderTypeId']?.toInt() ?? 0,
      counterParty: map['counterParty'] ?? '',
      transfered: map['transfered'] ?? false,
      fxRate: map['fxRate']?.toDouble() ?? 0.0,
      nettFxRate: map['nettFxRate']?.toDouble() ?? 0.0,
      grossFxRate: map['grossFxRate']?.toDouble() ?? 0.0,
      autoFxFeeInBaseCurrency: map['autoFxFeeInBaseCurrency']?.toDouble() ?? 0.0,
      totalInBaseCurrency: map['totalInBaseCurrency']?.toDouble() ?? 0.0,
      feeInBaseCurrency: map['feeInBaseCurrency']?.toDouble() ?? 0.0,
      totalFeesInBaseCurrency: map['totalFeesInBaseCurrency']?.toDouble() ?? 0.0,
      totalPlusFeeInBaseCurrency: map['totalPlusFeeInBaseCurrency']?.toDouble() ?? 0.0,
      totalPlusAllFeesInBaseCurrency: map['totalPlusAllFeesInBaseCurrency']?.toDouble() ?? 0.0,
      transactionTypeId: map['transactionTypeId']?.toInt() ?? 0,
      tradingVenue: map['tradingVenue'] ?? '',
    );
  }

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source));
}
