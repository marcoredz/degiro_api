import 'package:degiro_api/src/config/configs.dart';
import 'package:degiro_api/src/degiro_api_base.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

class DegiroInterceptors extends Interceptor {
  final container = ProviderContainer();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}');

    if (options.path != loginUrl && options.path != clientInfoUrl) {
      final degiro = container.read(degiroProvider);
      if (degiro.sessionId.isEmpty || degiro.accountInfo.intAccount == invalidIntValue) {
        return handler.reject(DioError(requestOptions: options, error: 'You must log in'));
      }
    }

    handler.next(options);
  }
}
