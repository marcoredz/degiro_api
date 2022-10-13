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
    required String id,
    ProductInfo? productInfo,
    @Default('') String positionType,
    @Default(0) int size,
    @Default(0) double price,
    @Default(0) double value,
    @Default(0) double breakEvenPrice,
    @Default(0) double realizedProductPl,
    @Default(0) double todayRealizedProductPl,
  }) = _PortfolioPosition;

  factory PortfolioPosition.fromJson(Map<String, Object?> json) =>
      _$PortfolioPositionFromJson(json);

  bool get isOpen => value != 0;
}
