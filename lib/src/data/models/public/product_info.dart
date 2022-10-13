import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.freezed.dart';
part 'product_info.g.dart';

@freezed
class ProductInfo with _$ProductInfo {
  const factory ProductInfo({
    @Default('') String id,
    @Default('') String name,
    @Default('') String isin,
    @Default('') String symbol,
    @Default(0) double contractSize,
    @Default('') String productType,
    @Default(0) int productTypeId,
    @Default(false) bool tradable,
    @Default('') String category,
    @Default('') String currency,
    @Default(false) bool active,
    @Default('') String exchangeId,
    @Default(false) bool onlyEodPrices,
    @Default(0) double closePrice,
    DateTime? closePriceDate,
  }) = _ProductInfo;

  factory ProductInfo.fromJson(Map<String, Object?> json) =>
      _$ProductInfoFromJson(json);
}
