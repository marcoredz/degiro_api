// TODO: Put public facing types in this file.

import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:degiro_api/src/data/repository/repository.dart';
import 'package:degiro_api/src/utils/process_portfolio.dart';
import 'package:riverpod/riverpod.dart';

late Provider<DegiroApi> degiroProvider;

class DegiroApi {
  late Repository _repository;
  String _sessionId = '';
  String _username = '';
  String _password = '';
  AccountInfo accountInfo = AccountInfo.init();

  String get sessionId => _sessionId;

  /// Must provide your username and password to use the library.
  DegiroApi(String username, String password) {
    _username = username;
    _password = password;
    _repository = Repository();

    // Assign the DegiroApi instance to the provider for DI
    degiroProvider = Provider((_) => this);
  }

  /// Login into Degiro and gets the account info.
  ///
  /// This login __cannot__ work with a 2-factor authentication.
  Future<AccountInfo> login() async {
    if (_username.isEmpty || _password.isEmpty) {
      throw DegiroApiError(message: 'You must enter the username and password');
    }
    final loginResult = await _repository.loginRequest(_username, _password);

    // First: login request returning the sessionId
    await loginResult.when(
      (error) => throw error..methodName = 'login',
      (loginResponse) async {
        _sessionId = loginResponse.sessionId;

        // Second: get client info based on the sessionId
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
      },
    );

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
  /// [PortfolioPosition] contains the [ProductInfo] property with product details.
  Future<List<PortfolioPosition>> portfolioPositions() async {
    final result = await _repository.getPortfolioPositionsRequest(
      sessionId,
      accountInfo.intAccount,
    );

    List<PortfolioPosition> positions = [];

    // gets portfolio positions,
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

        // gets product details by ids
        final List<String> productIds = positions.map((p) => p.id).toList();
        final productInfos = await this.productInfos(productIds);
        for (var position in positions) {
          position.productInfo = productInfos.firstWhere((info) => info.id == position.id);
        }
      },
    );

    return positions;
  }

  /// Gets the product details of a certain id.
  Future<ProductInfo> productInfo(String id) async {
    final result = await _repository.getProductsInfoRequest(
      sessionId,
      accountInfo.intAccount,
      [id],
    );

    late ProductInfo productInfo;

    result.when(
      (error) => error..methodName = "productInfo",
      (_productInfo) {
        productInfo = _productInfo.first;
      },
    );

    return productInfo;
  }

  /// Gets multiple products detail based on multiple ids.
  Future<List<ProductInfo>> productInfos(List<String> ids) async {
    final result = await _repository.getProductsInfoRequest(
      sessionId,
      accountInfo.intAccount,
      ids,
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
}
