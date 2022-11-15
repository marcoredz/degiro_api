import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:degiro_api/src/data/repository/repository.dart';
import 'package:degiro_api/src/utils/process_portfolio.dart';

class DegiroApi {
  late Repository _repository;
  static DegiroApi? _instance;

  String _sessionId = '';
  String _username = '';
  String _password = '';
  AccountInfo accountInfo = AccountInfo.init();

  String get sessionId => _sessionId;
  bool get isLoggedIn => _sessionId.isNotEmpty;

  static DegiroApi get instance => _instance ?? DegiroApi._default();

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

  // Default contructor with the purpose of
  // using the 'instance' getter not nullable
  DegiroApi._default() {
    _instance = this;
  }

  _init() {
    _repository = Repository();
    _instance = this;
  }

  /// Checks if the current sessionId is still valid
  Future<bool> _isSessionValid() async {
    if (_sessionId.isEmpty) return false;

    // Make get account info request to check the sessionId validity
    final result = await _repository.getAccountInfoRequest(
      sessionId,
      accountInfo.intAccount,
    );

    return result.when((error) => false, (success) => true);
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
        throw DegiroApiError(
          message: 'You must enter the username and password',
        );
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
      // This request works even with a previous sessionId that has been disposed
      final clientInfoResult =
          await _repository.getClientInfoRequest(_sessionId);

      clientInfoResult.when(
        (error) => throw error..methodName = 'login',
        (data) {
          accountInfo = data;
        },
      );

      // Check if the sessionId is still valid only after getting the accountInfo
      // to get the accountId used in the getAccountInfoRequest method
      if (!(await _isSessionValid())) {
        throw DegiroApiError(
          message: 'The sessionId provided is not valid anymore',
        )..methodName = 'login';
      }
    } else {
      throw DegiroApiError(message: 'Failed to retrieve the sessionId')
        ..methodName = 'login';
    }

    return accountInfo;
  }

  /// Logout from Degiro. The session is disposed.
  Future<void> logout() async {
    final result =
        await _repository.logoutRequest(_sessionId, accountInfo.intAccount);

    result.when(
      (error) => throw error..methodName = 'logout',
      (success) {
        _sessionId = '';
      },
    );
  }

  /// Gets the portfolio positions.
  ///
  /// [PortfolioPosition] contains the [ProductInfo] property with product infos.
  ///
  /// includeCash: if true, the method adds the account cash position to the result.
  Future<List<PortfolioPosition>> portfolioPositions({
    bool includeCash = false,
  }) async {
    final result = await _repository.getPortfolioPositionsRequest(
      sessionId,
      accountInfo.intAccount,
    );

    List<PortfolioPosition> positions = [];

    // Gets portfolio positions,
    // which only contain an id as product reference
    await result.when(
      (error) => throw error..methodName = 'portfolioPositions',
      (data) async {
        try {
          positions = processPortfolio(data, includeCash);
        } on Exception catch (e) {
          throw DegiroApiError(
            message: 'Something went wrong during portfolio processing',
            exception: e,
          )..methodName = 'processPortfolio';
        }

        // Gets product infos by ids
        final Set<String> productIds = positions.map((p) => p.id).toSet();
        final productInfos = await this.productInfos(productIds.toList());
        positions = positions
            .map(
              (position) => position.copyWith(
                productInfo: productInfos.firstWhere(
                  (info) => info.id == position.id,
                ),
              ),
            )
            .toList();
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

    return result.when(
      (error) => throw error..methodName = 'productInfo',
      (productInfo) => productInfo.first,
    );
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
      (error) => throw error..methodName = 'productInfos',
      (data) {
        productInfos = data;
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
      (data) async {
        transactions = data;
        // Gets product infos by ids
        final Set<String> productIds =
            transactions.map((p) => p.productId.toString()).toSet();
        final productInfos = await this.productInfos(productIds.toList());

        transactions = transactions
            .map(
              (transaction) => transaction.copyWith(
                productInfo: productInfos.firstWhere(
                  (info) => info.id == transaction.productId.toString(),
                ),
              ),
            )
            .toList();
      },
    );

    return transactions;
  }

  /// Products search by product name.
  ///
  /// Use limit and offset to paginate the result.
  ///
  /// Valid values for sortType are: **'asc'** and **'desc'**
  Future<List<ProductInfo>> searchProducts({
    required String searchText,
    int? limit,
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
      (data) {
        products = data;
      },
    );

    return products;
  }

  /// Account balance: gets all the cash movements done in the account
  Future<List<CashMovement>> cashMovements({
    DateTime? fromDate,
    DateTime? toDate,
    bool showFlatexMovements = false,
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
      (error) => throw error..methodName = 'cashMovements',
      (data) => data,
    );

    // As default 'showFlatexMovements' is set to false.
    // Normally, if you want to know the account cash movements it's more clear to see just the
    // real operations because Degiro adds its own operations regarding flatex bank account.
    if (!showFlatexMovements) {
      movements = movements
          .where((m) => m.movementType != MovementType.flatexCashSweep)
          .toList();
    }

    return movements;
  }
}
