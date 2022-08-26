import 'dart:convert';

import 'package:degiro_api/src/config/constants.dart';

/// transaction: product transactions (buy or sell of products)
///
/// cashTransaction:
///   - transaction fees
///   - deposits/withdrawals
///   - Flatex interests
///
/// flatexCashSweep: Degiro Flatex account cash sweeps
enum MovementType { transaction, cashTransaction, flatexCashSweep }

class CashMovement {
  final DateTime date;
  final DateTime valueDate;
  final int id;
  final int? productId;
  final String? orderdId;
  final String description;
  final String currency;
  final double change;
  final _Balance balance;
  final String type;

  MovementType get movementType {
    switch (type) {
      case "TRANSACTION":
        return MovementType.transaction;
      case "CASH_TRANSACTION":
        return MovementType.cashTransaction;
      case "FLATEX_CASH_SWEEP":
        return MovementType.flatexCashSweep;
      default:
        return MovementType.transaction;
    }
  }

  CashMovement({
    required this.date,
    required this.valueDate,
    required this.id,
    this.productId,
    this.orderdId,
    required this.description,
    required this.currency,
    required this.change,
    required this.balance,
    required this.type,
  });

  factory CashMovement.fromMap(Map<String, dynamic> map) {
    return CashMovement(
      date: DateTime.parse(map['date']),
      valueDate: DateTime.parse(map['valueDate']),
      id: map['id']?.toInt() ?? invalidIntValue,
      productId: map['productId']?.toInt(),
      orderdId: map['orderdId'],
      description: map['description'] ?? '',
      currency: map['currency'] ?? '',
      change: map['change']?.toDouble() ?? 0.0,
      balance: _Balance.fromMap(map['balance']),
      type: map['type'] ?? '',
    );
  }

  factory CashMovement.fromJson(String source) =>
      CashMovement.fromMap(json.decode(source));
}

class _Balance {
  final double unsettledCash;
  final double flatexCash;
  final double total;

  _Balance({
    required this.unsettledCash,
    required this.flatexCash,
    required this.total,
  });

  factory _Balance.fromMap(Map<String, dynamic> map) {
    return _Balance(
      unsettledCash: map['unsettledCash']?.toDouble() ?? 0.0,
      flatexCash: map['flatexCash']?.toDouble() ?? 0.0,
      total: map['total']?.toDouble() ?? 0.0,
    );
  }
}
