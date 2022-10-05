import 'package:degiro_api/src/data/models/public/product_info.dart';

/// DegiroApi class to store portfolio position infos
class PortfolioPosition {
  String id = '';
  ProductInfo? productInfo;
  String positionType = '';
  int size = 0;
  double price = 0;
  double value = 0;
  double breakEvenPrice = 0;
  double realizedProductPl = 0;
  double todayRealizedProductPl = 0;

  bool get isOpen => value != 0;
}
