import 'package:degiro_api/src/config/configs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_movement.freezed.dart';
part 'cash_movement.g.dart';

/// transaction: product transactions (buy or sell of products)
///
/// cashTransaction:
///   - transaction fees
///   - deposits/withdrawals
///   - Flatex interests
///
/// flatexCashSweep: Degiro Flatex account cash sweeps
enum MovementType { transaction, cashTransaction, flatexCashSweep }

@freezed
class CashMovement with _$CashMovement {
  const CashMovement._();

  MovementType get movementType {
    switch (type) {
      case 'TRANSACTION':
        return MovementType.transaction;
      case 'CASH_TRANSACTION':
        return MovementType.cashTransaction;
      case 'FLATEX_CASH_SWEEP':
        return MovementType.flatexCashSweep;
      default:
        return MovementType.transaction;
    }
  }

  const factory CashMovement({
    required DateTime date,
    required DateTime valueDate,
    @Default(invalidIntValue) int id,
    @Default(invalidIntValue) int? productId,
    String? orderdId,
    @Default('') String description,
    @Default('') String currency,
    @Default(0) double change,
    CashMovementBalance? balance,
    @Default('') String type,
  }) = _CashMovement;

  factory CashMovement.fromJson(Map<String, Object?> json) =>
      _$CashMovementFromJson(json);
}

@JsonSerializable()
class CashMovementBalance {
  @JsonKey(defaultValue: 0)
  final double unsettledCash;
  @JsonKey(defaultValue: 0)
  final double flatexCash;
  @JsonKey(defaultValue: 0)
  final double total;

  const CashMovementBalance({
    required this.unsettledCash,
    required this.flatexCash,
    required this.total,
  });

  factory CashMovementBalance.fromJson(Map<String, Object?> json) =>
      _$CashMovementBalanceFromJson(json);
}
