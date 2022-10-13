import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/public/product_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

enum Buysell { buy, sell, unkown }

@freezed
class Transaction with _$Transaction {
  const Transaction._();

  Buysell get action {
    switch (buysell) {
      case 'B':
        return Buysell.buy;
      case 'S':
        return Buysell.sell;
      default:
        return Buysell.unkown;
    }
  }

  const factory Transaction({
    @Default(invalidIntValue) int id,
    @Default(invalidIntValue) int productId,
    ProductInfo? productInfo,
    required DateTime date,
    @Default('') String buysell,
    @Default(0) double price,
    @Default(0) int quantity,
    @Default(0) double total,
    @Default(0) int orderTypeId,
    @Default('') String counterParty,
    @Default(false) bool transfered,
    @Default(0) double fxRate,
    @Default(0) double nettFxRate,
    @Default(0) double grossFxRate,
    @Default(0) double autoFxFeeInBaseCurrency,
    @Default(0) double totalInBaseCurrency,
    @Default(0) double feeInBaseCurrency,
    @Default(0) double totalFeesInBaseCurrency,
    @Default(0) double totalPlusFeeInBaseCurrency,
    @Default(0) double totalPlusAllFeesInBaseCurrency,
    @Default(0) int transactionTypeId,
    @Default('') String tradingVenue,
  }) = _Transaction;

  factory Transaction.fromJson(
    Map<String, Object?> json,
  ) =>
      _$TransactionFromJson(json);
}
