import 'dart:convert';

class ProductInfo {
  String id;
  String name;
  String isin;
  String symbol;
  int contractSize;
  String productType;
  int productTypeId;
  bool tradable;
  String category;
  String currency;
  bool active;
  String exchangeId;
  bool onlyEodPrices;
  double closePrice;
  DateTime? closePriceDate;

  ProductInfo({
    required this.id,
    required this.name,
    required this.isin,
    required this.symbol,
    required this.contractSize,
    required this.productType,
    required this.productTypeId,
    required this.tradable,
    required this.category,
    required this.currency,
    required this.active,
    required this.exchangeId,
    required this.onlyEodPrices,
    required this.closePrice,
    this.closePriceDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isin': isin,
      'symbol': symbol,
      'contractSize': contractSize,
      'productType': productType,
      'productTypeId': productTypeId,
      'tradable': tradable,
      'category': category,
      'currency': currency,
      'active': active,
      'exchangeId': exchangeId,
      'onlyEodPrices': onlyEodPrices,
      'closePrice': closePrice,
      'closePriceDate': closePriceDate,
    };
  }

  factory ProductInfo.fromMap(Map<String, dynamic> map) {
    return ProductInfo(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      isin: map['isin'] ?? '',
      symbol: map['symbol'] ?? '',
      contractSize: map['contractSize']?.toInt() ?? 0,
      productType: map['productType'] ?? '',
      productTypeId: map['productTypeId']?.toInt() ?? 0,
      tradable: map['tradable'] ?? false,
      category: map['category'] ?? '',
      currency: map['currency'] ?? '',
      active: map['active'] ?? false,
      exchangeId: map['exchangeId'] ?? '',
      onlyEodPrices: map['onlyEodPrices'] ?? false,
      closePrice: map['closePrice']?.toDouble() ?? 0.0,
      closePriceDate: map['closePriceDate'] != null
          ? DateTime.parse(map['closePriceDate'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductInfo.fromJson(String source) =>
      ProductInfo.fromMap(json.decode(source));
}
