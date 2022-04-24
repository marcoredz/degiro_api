abstract class MarketActions {
  static String buy = 'BUY';
  static String sell = 'SELL';
}

abstract class MarketOrderTypes {
  static int limited = 0;
  static int stopLossLimit = 1;
  static int market = 2;
  static int stopLoss = 3;
}

abstract class TimeTypes {
  static int day = 1;
  static int continuos = 3;
}

abstract class ProductTypes {
  static int all = -1;
  static int shares = 1;
  static int bonds = 2;
  static int futures = 7;
  static int options = 8;
  static int investmendFunds = 13;
  static int leveragedProducts = 14;
  static int etfs = 131;
  static int cfds = 535;
  static int warrants = 536;
}

abstract class PortfolioPositionsType {
  static String all = 'all';
  static String allPositions = 'allPositions';
  static String open = 'open';
  static String closed = 'closed';
}

abstract class OrderTypes {
  static String active = 'orders';
  static String historical = 'historicalOrders';
  static String transactions = 'transactions';
}
