import 'dart:convert';

class LoginResponse {
  final bool isPassCodeEnabled;
  final String locale;
  final String redirectUrl;
  final String sessionId;
  final int status;
  final String statusText;

  LoginResponse({
    required this.isPassCodeEnabled,
    required this.locale,
    required this.redirectUrl,
    required this.sessionId,
    required this.status,
    required this.statusText,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      isPassCodeEnabled: map['isPassCodeEnabled'] ?? false,
      locale: map['locale'] ?? '',
      redirectUrl: map['redirectUrl'] ?? '',
      sessionId: map['sessionId'] ?? '',
      status: map['status'] ?? 0,
      statusText: map['statusText'] ?? '',
    );
  }

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginResponse(isPassCodeEnabled: $isPassCodeEnabled, locale: $locale, redirectUrl: $redirectUrl, sessionId: $sessionId, status: $status, statusText: $statusText)';
  }
}
