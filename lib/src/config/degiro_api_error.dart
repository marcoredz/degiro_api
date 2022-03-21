class DegiroApiError implements Exception {
  String get message => "[DegiroApiError] - $methodName - $_message";
  String _message = "";
  // The method name where the error is thrown
  String methodName = "";

  final int? code;
  final Exception? exception;

  /// - "message": the error message, can be customized.
  /// - "code": the response API status code if we did a request, otherwise is null.
  /// - "exception": the full exception of the root error.
  DegiroApiError({required String message, this.code, this.exception}) {
    _message = message;
  }

  @override
  String toString() {
    return 'DegiroApiError(_message: $_message, methodName: $methodName, code: $code, exception: $exception)';
  }
}
