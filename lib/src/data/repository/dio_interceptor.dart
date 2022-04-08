import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/degiro_api_base.dart';
import 'package:dio/dio.dart';

class DegiroInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}');

    if (options.path != loginUrl && options.path != clientInfoUrl) {
      if (DegiroApi.instance.sessionId.isEmpty ||
          DegiroApi.instance.accountInfo.intAccount == invalidIntValue) {
        return handler.reject(DioError(requestOptions: options, error: 'You must log in'));
      }
    }

    handler.next(options);
  }
}
