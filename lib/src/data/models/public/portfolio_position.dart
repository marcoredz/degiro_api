// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:degiro_api/src/data/models/public/product_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_position.freezed.dart';
part 'portfolio_position.g.dart';

/// DegiroApi class to store portfolio position infos
@freezed
class PortfolioPosition with _$PortfolioPosition {
  const PortfolioPosition._();

  const factory PortfolioPosition({
    /// Id of the portfolio position (NOT of the product)
    required String id,
    ProductInfo? productInfo,

    /// Can be 'PRODUCT' or 'CASH'
    @Default('') String positionType,

    /// The current owned quantity of the product.
    ///
    /// If it is zero, it means the position is closed.
    @Default(0) int size,

    /// Yesterday price or the last price recorded not today.
    ///
    /// To get the real latest price provided by Degiro, use the `closePrice`
    /// property of the [ProductInfo] object.
    @Default(0) double price,

    /// The pre computed by Degiro APIs yesterday value of the position: <br/>
    /// value = price * size.
    ///
    /// You don't see this value on Degiro UI.
    @Default(0) double value,

    /// Total P/L offset value (you don't see this value on Degiro UI)
    /// Used to calculate the `totalPl` property.
    @Default(0) double plBase,

    /// Today P/L offset value (you don't see this value on Degiro UI)
    /// Used to calculate the `todayPl` property.
    @Default(0) double todayPlBase,
    @Default(0) double breakEvenPrice,
    @Default(0) double realizedProductPl,
    @Default(0) double todayRealizedProductPl,
  }) = _PortfolioPosition;

  factory PortfolioPosition.fromJson(Map<String, Object?> json) =>
      _$PortfolioPositionFromJson(json);

  /// Identify an open position
  bool get isOpen => value != 0;

  /// Latest position value calculated by the package using the product
  /// close price.
  double get latestValue =>
      double.tryParse(
        ((productInfo?.closePrice ?? 0) * size).toStringAsFixed(2),
      ) ??
      0;

  /// The 'P/L' value you see on the portfolio position of Degiro UI.
  double get todayPl =>
      double.tryParse(
        (todayPlBase + latestValue).toStringAsFixed(2),
      ) ??
      0;

  /// The 'Total P/L' value you see on the portfolio position of Degiro UI.
  double get totalPl =>
      double.tryParse(
        (plBase + latestValue).toStringAsFixed(2),
      ) ??
      0;

  /// The 'Unrealised P/L' value you see on the portfolio position of Degiro UI.
  double get unrealizedPl =>
      double.tryParse(
        (totalPl - realizedProductPl).toStringAsFixed(2),
      ) ??
      0;
}
