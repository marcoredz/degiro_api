import 'package:degiro_api/src/data/models/public/portfolio_position.dart';

List<PortfolioPosition> processPortfolio(List positions) {
  List<PortfolioPosition> result = [];

  for (final position in positions) {
    final newPosition = PortfolioPosition()..id = position['id'] ?? '';
    for (final prop in position['value']) {
      newPosition.positionType =
          prop['name'] == 'positionType' ? prop['value'] : newPosition.positionType;
      newPosition.size = prop['name'] == 'size' ? prop['value'].toInt() : newPosition.size;
      newPosition.price = prop['name'] == 'price' ? prop['value'].toDouble() : newPosition.price;
      newPosition.value = prop['name'] == 'value' ? prop['value'].toDouble() : newPosition.value;
      newPosition.breakEvenPrice =
          prop['name'] == 'breakEvenPrice' ? prop['value'].toDouble() : newPosition.breakEvenPrice;
      newPosition.realizedProductPl = prop['name'] == 'realizedProductPl'
          ? prop['value'].toDouble()
          : newPosition.realizedProductPl;
      newPosition.todayRealizedProductPl = prop['name'] == 'todayRealizedProductPl'
          ? prop['value'].toDouble()
          : newPosition.todayRealizedProductPl;
    }

    result.add(newPosition);
  }

  return result;
}
