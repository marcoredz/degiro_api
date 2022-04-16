import 'dart:convert';

import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/repository/dio_interceptor.dart';
import 'package:degiro_api/src/data/repository/interface.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';

class Repository implements IRepository {
  late Dio _dio;

  static final Repository _instance = Repository._internal();
  factory Repository() {
    return _instance;
  }

  Repository._internal() {
    // Dio client configuration
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _dio.interceptors.add(DegiroInterceptors());
  }

  @override
  Future<Result<DegiroApiError, LoginResponse>> loginRequest(
      String username, String password) async {
    try {
      final response = await _dio.post(
        loginUrl,
        data: {
          'username': username,
          'password': password,
          'isPassCodeReset': false,
          'isRedirectToMobile': false
        },
      );

      return Success(LoginResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        final degiroStatusText = e.response?.data['statusText'] ?? '';
        return Error(DegiroApiError(message: degiroStatusText, code: e.response?.statusCode));
      }

      return Error(DegiroApiError(message: e.message, exception: e));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<DegiroApiError, AccountInfo>> getClientInfoRequest(String sessionId) async {
    try {
      final response = await _dio.get(
        clientInfoUrl,
        queryParameters: {'sessionId': sessionId},
      );

      return Success(AccountInfo.fromMap(response.data['data']));
    } on DioError catch (e) {
      if (e.response != null) {
        final degiroStatusText = (e.response?.data['errors'] as List).first['text'] ?? '';
        return Error(DegiroApiError(message: degiroStatusText, code: e.response?.statusCode));
      }
      return Error(DegiroApiError(message: e.message, code: e.response?.statusCode));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<DegiroApiError, void>> logoutRequest(String sessionId, int intAccount) async {
    try {
      await _dio.get(
        '$logoutUrl;jsessionid=$sessionId',
        queryParameters: {'sessionId': sessionId, 'intAccount': intAccount},
      );

      return Success(null);
    } on DioError catch (e) {
      return Error(DegiroApiError(message: e.message, code: e.response?.statusCode));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<DegiroApiError, List<dynamic>>> getPortfolioPositionsRequest(
    String sessionId,
    int intAccount,
  ) async {
    try {
      final response = await _dio.get(
        '$getPortfolioUrl/$intAccount;jsessionid=$sessionId',
        queryParameters: {'portfolio': 0},
      );

      return Success(response.data['portfolio']['value']);
    } on DioError catch (e) {
      return Error(DegiroApiError(message: e.message, code: e.response?.statusCode));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<DegiroApiError, List<ProductInfo>>> getProductsInfoRequest(
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

      final data = Map<String, dynamic>.from(response.data['data']);

      return Success(data.entries.map((e) => ProductInfo.fromMap(e.value)).toList());
    } on DioError catch (e) {
      return Error(DegiroApiError(message: e.message, code: e.response?.statusCode));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<DegiroApiError, List<Transaction>>> getTransactions(
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

      final data = List.from(response.data['data']);

      return Success(data.map((e) => Transaction.fromMap(e)).toList());
    } on DioError catch (e) {
      return Error(DegiroApiError(message: e.message, code: e.response?.statusCode));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }

  @override
  Future<Result<DegiroApiError, List<ProductInfo>>> searchProducts(
    String sessionId,
    int intAccount,
    String searchText,
    int limit,
    int offset,
  ) async {
    try {
      final response = await _dio.get(
        productSearchUrl,
        queryParameters: {
          'searchText': searchText,
          'limit': limit,
          'offset': offset,
          'intAccount': intAccount,
          'sessionId': sessionId,
        },
      );

      final List<dynamic> productsJson = response.data['products'];

      return Success(productsJson.map((e) => ProductInfo.fromMap(e)).toList());
    } on DioError catch (e) {
      return Error(DegiroApiError(message: e.message, code: e.response?.statusCode));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }
}
