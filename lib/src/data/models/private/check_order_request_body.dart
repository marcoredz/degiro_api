import 'dart:convert';

class CheckOrderRequestBody {
  final String buySell;
  final int orderType;
  final String productId;
  final int timeType;
  final int size;
  final double? price;
  final double? stopPrice;

  CheckOrderRequestBody({
    required this.buySell,
    required this.orderType,
    required this.productId,
    required this.timeType,
    required this.size,
    this.price,
    this.stopPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'buySell': buySell,
      'orderType': orderType,
      'productId': productId,
      'timeType': timeType,
      'size': size,
      if (price != null) 'price': price,
      if (stopPrice != null) 'stopPrice': stopPrice,
    };
  }

  String toJson() => json.encode(toMap());
}
