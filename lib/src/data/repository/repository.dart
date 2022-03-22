import 'dart:convert';

import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/data/repository/dio_interceptor.dart';
import 'package:degiro_api/src/data/repository/interface.dart';
import 'package:degiro_api/src/data/models/models.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';

class Repository implements IRepository {
  late Dio _dio;

  Repository() {
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
        final degiroStatusText = e.response?.data.statusText ?? '';
        return Error(DegiroApiError(code: e.response?.statusCode, message: degiroStatusText));
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
      return Error(DegiroApiError(message: e.message));
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
      return Error(DegiroApiError(message: e.message));
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
      return Error(DegiroApiError(message: e.message));
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

      var list = [];
      for (var element in data.entries) {
        list.add(ProductInfo.fromMap(element.value));
      }

      //TODO continua
      return Success([]);

      // return Success(
      //   (response.data['data'] as Map<String, dynamic>)
      //       .entries
      //       .map((e) => ProductInfo.fromMap(e))
      //       .toList(),
      // );
    } on DioError catch (e) {
      return Error(DegiroApiError(message: e.message));
    } on Exception catch (e) {
      return Error(DegiroApiError(message: e.toString()));
    }
  }
}
