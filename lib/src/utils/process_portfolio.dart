import 'package:degiro_api/src/data/models/public/portfolio_position.dart';

List<PortfolioPosition> processPortfolio(List positions) {
  List<PortfolioPosition> result = [];

  for (final position in positions) {
    final newPosition = PortfolioPosition()..id = position?['id'] ?? '';
    for (final item in position['value']) {
      newPosition.positionType =
          item['name'] == 'positionType' ? item['value'] : newPosition.positionType;
      newPosition.size = item['name'] == 'size' ? item['value'].toInt() : newPosition.size;
      newPosition.price = item['name'] == 'price' ? item['value'].toDouble() : newPosition.price;
      newPosition.value = item['name'] == 'value' ? item['value'].toDouble() : newPosition.value;
      newPosition.breakEvenPrice =
          item['name'] == 'breakEvenPrice' ? item['value'].toDouble() : newPosition.breakEvenPrice;
      newPosition.realizedProductPl = item['name'] == 'realizedProductPl'
          ? item['value'].toDouble()
          : newPosition.realizedProductPl;
      newPosition.todayRealizedProductPl = item['name'] == 'todayRealizedProductPl'
          ? item['value'].toDouble()
          : newPosition.todayRealizedProductPl;
    }

    result.add(newPosition);
  }

  return result;
}
