import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:degiro_api/src/data/repository/repository.dart';
import 'package:degiro_api/src/utils/process_portfolio.dart';

class DegiroApi {
  late Repository _repository;
  static late DegiroApi _instance;

  String _sessionId = '';
  String _username = '';
  String _password = '';
  AccountInfo accountInfo = AccountInfo.init();

  String get sessionId => _sessionId;

  static DegiroApi get instance => _instance;

  /// Access to Degiro with normal credentials.
  DegiroApi.fromCredentials(String username, String password) {
    _username = username;
    _password = password;
    _init();
  }

  /// Access to Degiro with the sessionId.
  ///
  /// How to get the sessionId: (link)
  DegiroApi.fromSession(String sessionId) {
    _sessionId = sessionId;
    _init();
  }

  _init() {
    _repository = Repository();
    _instance = this;
  }

  /// Login into Degiro and gets the account info.
  ///
  /// It works with both [DegiroApi] constructors:
  /// When the sessionId is not initialized, it makes the login request with username and
  /// password to obtain the sessionId.
  ///
  /// When the sessionId is initialized, skips the login request and gets the client info.
  Future<AccountInfo> login() async {
    if (_sessionId.isEmpty) {
      if (_username.isEmpty || _password.isEmpty) {
        throw DegiroApiError(message: 'You must enter the username and password');
      }

      final loginResult = await _repository.loginRequest(_username, _password);

      // Login request returning the sessionId
      loginResult.when(
        (error) => throw error..methodName = 'login',
        (loginResponse) {
          _sessionId = loginResponse.sessionId;
        },
      );
    }

    // Gets client info based on the sessionId
    if (_sessionId.isNotEmpty) {
      final clientInfoResult = await _repository.getClientInfoRequest(_sessionId);

      clientInfoResult.when(
        (error) => throw error..methodName = 'login',
        (_accountInfo) {
          accountInfo = _accountInfo;
        },
      );
    } else {
      throw DegiroApiError(message: 'Failed to retrieve the sessionId')..methodName = 'login';
    }

    return accountInfo;
  }

  /// Logout from Degiro. The session is disposed.
  Future<void> logout() async {
    final result = await _repository.logoutRequest(_sessionId, accountInfo.intAccount);

    result.when(
      (error) => throw error..methodName = 'logout',
      (success) => null,
    );
  }

  /// Gets the portfolio positions.
  ///
  /// [PortfolioPosition] contains the [ProductInfo] property with product infos.
  Future<List<PortfolioPosition>> portfolioPositions() async {
    final result = await _repository.getPortfolioPositionsRequest(
      sessionId,
      accountInfo.intAccount,
    );

    List<PortfolioPosition> positions = [];

    // Gets portfolio positions,
    // which only contain an id as product reference
    await result.when(
      (error) => throw error..methodName = 'portfolioPositions',
      (_positions) async {
        try {
          positions = processPortfolio(_positions);
        } on Exception catch (e) {
          throw DegiroApiError(
            message: 'Something went wrong during portfolio processing',
            exception: e,
          )..methodName = 'processPortfolio';
        }

        // Gets product infos by ids
        final Set<String> productIds = positions.map((p) => p.id).toSet();
        final productInfos = await this.productInfos(productIds.toList());
        for (var position in positions) {
          position.productInfo = productInfos.firstWhere((info) => info.id == position.id);
        }
      },
    );

    return positions;
  }

  /// Gets the product infos of a certain id.
  Future<ProductInfo> productInfo(String id) async {
    final result = await _repository.getProductsInfoRequest(
      sessionId,
      accountInfo.intAccount,
      [id],
    );

    late ProductInfo productInfo;

    result.when(
      (error) => throw error..methodName = "productInfo",
      (_productInfo) {
        productInfo = _productInfo.first;
      },
    );

    return productInfo;
  }

  /// Gets multiple products infos based on multiple ids.
  Future<List<ProductInfo>> productInfos(List<String> ids) async {
    final result = await _repository.getProductsInfoRequest(
      sessionId,
      accountInfo.intAccount,
      ids.toSet().toList(), //toSet to assert uniqueness between ids
    );

    List<ProductInfo> productInfos = [];

    result.when(
      (error) => throw error..methodName = "productInfos",
      (_productInfos) {
        productInfos = _productInfos;
      },
    );

    return productInfos;
  }

  /// Gets account transactions filtered by any date.
  /// If no date interval is provided, all account transactions are returned.
  Future<List<Transaction>> transactions({
    DateTime? fromDate,
    DateTime? toDate,
    bool groupByOrder = false,
  }) async {
    // Setting default filter to last month
    fromDate ??= DateTime.now().subtract(Duration(days: 31));
    toDate ??= DateTime.now();

    final result = await _repository.getTransactionsRequest(
      sessionId,
      accountInfo.intAccount,
      fromDate,
      toDate,
      groupByOrder,
    );

    List<Transaction> transactions = [];

    await result.when(
      (error) => throw error..methodName = 'transactions',
      (_transactions) async {
        transactions = _transactions;
        // Gets product infos by ids
        final Set<String> productIds = transactions.map((p) => p.productId.toString()).toSet();
        final productInfos = await this.productInfos(productIds.toList());

        for (var transaction in transactions) {
          transaction.productInfo = productInfos.firstWhere(
            (info) => info.id == transaction.productId.toString(),
          );
        }
      },
    );

    return transactions;
  }

  /// Products search by product name
  Future<List<ProductInfo>> searchProducts({
    required String searchText,
    int limit = 5,
    int offset = 0,
    int? productType,
    String? sortColumn,
    String? sortType,
  }) async {
    final result = await _repository.searchProductsRequest(
      sessionId,
      accountInfo.intAccount,
      searchText,
      limit,
      offset,
      productType ?? invalidIntValue,
      sortColumn,
      sortType,
    );

    List<ProductInfo> products = [];

    result.when(
      (error) => throw error..methodName = 'searchProducts',
      (_products) {
        products = _products;
      },
    );

    return products;
  }

  /// Account balance: gets all the cash movements done in the account
  Future<List<CashMovement>> cashMovements({
    DateTime? fromDate,
    DateTime? toDate,
    bool showDegiroMovements = false,
  }) async {
    // Setting default filter to last month
    fromDate ??= DateTime.now().subtract(Duration(days: 31));
    toDate ??= DateTime.now();

    final result = await _repository.getCashMovementsRequest(
      sessionId,
      accountInfo.intAccount,
      fromDate,
      toDate,
    );

    List<CashMovement> movements = [];

    movements = result.when(
      (error) => throw error..methodName = "cashMovements",
      (_movements) => _movements,
    );

    // As default 'showDegiroMovements' is set to false.
    // Normally, if you want to know the account cash movements it's more clear to see just the
    // real operations because Degiro adds its own operations regarding flatex bank account.
    if (!showDegiroMovements) {
      movements = movements.where((m) => m.movementType != MovementType.flatexCashSweep).toList();
    }

    return movements;
  }
}
