import 'dart:convert';

import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:degiro_api/src/data/repository/dio_interceptor.dart';
import 'package:degiro_api/src/data/repository/interface.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

/// Main DegiroApi repository, using Dio as http client
/// Contains the direct requests to Degiro APIs
class Repository implements IRepository {
  late Dio _dio;

  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  /// Dio client configuration
  Repository._internal() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _dio.interceptors.add(DegiroInterceptors());
  }

  @override
  Future<Result<LoginResponse, DegiroApiError>> loginRequest(
    String username,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        loginUrl,
        data: {
          'username': username,
          'password': password,
          'isPassCodeReset': false,
          'isRedirectToMobile': false,
        },
      );

      return Success(LoginResponse.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response != null) {
        final degiroStatusText = e.response?.data['statusText'] ?? '';
        return Error(
          DegiroApiError(
            message: degiroStatusText,
            code: e.response?.statusCode,
          ),
        );
      }

      return Error(DegiroApiError(message: e.message ?? '', exception: e));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<AccountInfo, DegiroApiError>> getClientInfoRequest(
    String sessionId,
  ) async {
    try {
      final response = await _dio.get(
        clientInfoUrl,
        queryParameters: {'sessionId': sessionId},
      );

      return Success(AccountInfo.fromJson(response.data['data']));
    } on DioException catch (e) {
      if (e.response != null) {
        final errors = List.from(e.response!.data['errors'] ?? []);
        return Error(
          DegiroApiError(
            // Getting Degiro status text
            message: errors.isNotEmpty ? errors.first['text'] : '',
            code: e.response?.statusCode,
          ),
        );
      }
      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<void, DegiroApiError>> logoutRequest(
    String sessionId,
    int intAccount,
  ) async {
    try {
      await _dio.get(
        '$logoutUrl;jsessionid=$sessionId',
        queryParameters: {'sessionId': sessionId, 'intAccount': intAccount},
      );

      return Success(null);
    } on DioException catch (e) {
      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<List<dynamic>, DegiroApiError>> getPortfolioPositionsRequest(
    String sessionId,
    int intAccount,
  ) async {
    try {
      final response = await _dio.get(
        '$getPortfolioUrl/$intAccount;jsessionid=$sessionId',
        queryParameters: {'portfolio': 0},
      );

      return Success(response.data['portfolio']['value']);
    } on DioException catch (e) {
      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<List<ProductInfo>, DegiroApiError>> getProductsInfoRequest(
    String sessionId,
    int intAccount,
    List<String> productIds,
  ) async {
    try {
      final response = await _dio.post(
        productInfoUrl,
        queryParameters: {'sessionId': sessionId, 'intAccount': intAccount},
        data: json.encode(productIds),
      );

      if (Map.from(response.data).isEmpty) return Success([]);

      final data = Map<String, dynamic>.from(response.data['data']);

      return Success(
        data.entries.map((e) => ProductInfo.fromJson(e.value)).toList(),
      );
    } on DioException catch (e) {
      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<List<Transaction>, DegiroApiError>> getTransactionsRequest(
    String sessionId,
    int intAccount,
    DateTime fromDate,
    DateTime toDate,
    bool groupByOrder,
  ) async {
    try {
      final response = await _dio.get(
        getTransactionsUrl,
        queryParameters: {
          'sessionId': sessionId,
          'intAccount': intAccount,
          'fromDate': fromDate.toDegiroFormat(),
          'toDate': toDate.toDegiroFormat(),
          'groupByOrder': groupByOrder,
        },
      );

      if (Map.from(response.data).isEmpty) return Success([]);

      final data = List.from(response.data['data']);

      return Success(data.map((e) => Transaction.fromJson(e)).toList());
    } on DioException catch (e) {
      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<List<ProductInfo>, DegiroApiError>> searchProductsRequest(
    String sessionId,
    int intAccount,
    String searchText,
    int? limit,
    int offset,
    int productType, [
    String? sortColumn,
    String? sortType,
  ]) async {
    try {
      final response = await _dio.get(
        productSearchUrl,
        queryParameters: {
          'searchText': searchText,
          if (limit != null) 'limit': limit,
          'offset': offset,
          'intAccount': intAccount,
          'sessionId': sessionId,
          if (productType != invalidIntValue) 'productTypeId': productType,
          if (sortColumn != null) 'sortColumns': sortColumn,
          if (sortType != null) 'sortTypes': sortType,
        },
      );

      final productsJson = List.from(response.data['products'] ?? []);

      return Success(productsJson.map((e) => ProductInfo.fromJson(e)).toList());
    } on DioException catch (e) {
      if (e.response != null) {
        final errors = List.from(e.response!.data['errors'] ?? []);
        return Error(
          DegiroApiError(
            // Getting Degiro status text
            message: errors.isNotEmpty ? errors.first['text'] : '',
            code: e.response?.statusCode,
          ),
        );
      }

      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<List<CashMovement>, DegiroApiError>> getCashMovementsRequest(
    String sessionId,
    int intAccount,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    try {
      final response = await _dio.get(
        getAccountBalanceUrl,
        queryParameters: {
          'sessionId': sessionId,
          'intAccount': intAccount,
          'fromDate': fromDate.toDegiroFormat(),
          'toDate': toDate.toDegiroFormat(),
        },
      );

      if (Map.from(response.data).isEmpty) return Success([]);
      if (Map.from(response.data['data']).isEmpty) return Success([]);

      final data = List.from(response.data['data']['cashMovements']);

      return Success(data.map((e) => CashMovement.fromJson(e)).toList());
    } on DioException catch (e) {
      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<void, DegiroApiError>> getAccountInfoRequest(
    String sessionId,
    int intAccount,
  ) async {
    try {
      // We don't care about the response because we use this request
      // just to check if the sessionId is still valid
      await _dio.get(
        '$getAccountInfoUrl$intAccount;jsessionid=$sessionId',
      );

      return Success(null);
    } on DioException catch (e) {
      return Error(
        DegiroApiError(message: e.message ?? '', code: e.response?.statusCode),
      );
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }
}
