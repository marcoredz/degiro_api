import 'package:degiro_api/src/data/models/public/portfolio_position.dart';

/// Process portfolio positions coming from Degiro APIs to map in a list of
/// [PortfolioPosition] type, simplifying use.
///
/// Add the position only if it is a product, excluding cash position.
List<PortfolioPosition> processPortfolio(List positions, bool includeCash) {
  List<PortfolioPosition> result = [];

  for (final position in positions) {
    PortfolioPosition newPosition = PortfolioPosition(id: position['id'] ?? '');
    for (final prop in position['value']) {
      newPosition = newPosition.copyWith(
        positionType: prop['name'] == 'positionType'
            ? prop['value']
            : newPosition.positionType,
        size: prop['name'] == 'size'
            ? (prop['value'] as num? ?? 0).toInt()
            : newPosition.size,
        price: prop['name'] == 'price'
            ? (prop['value'] as num? ?? 0).toDouble()
            : newPosition.price,
        value: prop['name'] == 'value'
            ? (prop['value'] as num? ?? 0).toDouble()
            : newPosition.value,
        breakEvenPrice: prop['name'] == 'breakEvenPrice'
            ? (prop['value'] as num? ?? 0).toDouble()
            : newPosition.breakEvenPrice,
        realizedProductPl: prop['name'] == 'realizedProductPl'
            ? (prop['value'] as num? ?? 0).toDouble()
            : newPosition.realizedProductPl,
        todayRealizedProductPl: prop['name'] == 'todayRealizedProductPl'
            ? (prop['value'] as num? ?? 0).toDouble()
            : newPosition.todayRealizedProductPl,
      );
    }

    if (newPosition.positionType == 'PRODUCT' || includeCash) {
      result.add(newPosition);
    }
  }

  return result;
}
