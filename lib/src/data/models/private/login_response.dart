import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(defaultValue: false)
  final bool isPassCodeEnabled;
  @JsonKey(defaultValue: '')
  final String locale;
  @JsonKey(defaultValue: '')
  final String redirectUrl;
  @JsonKey(defaultValue: '')
  final String sessionId;
  @JsonKey(defaultValue: 0)
  final int status;
  @JsonKey(defaultValue: '')
  final String statusText;

  LoginResponse({
    required this.isPassCodeEnabled,
    required this.locale,
    required this.redirectUrl,
    required this.sessionId,
    required this.status,
    required this.statusText,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse(isPassCodeEnabled: $isPassCodeEnabled, locale: $locale, redirectUrl: $redirectUrl, sessionId: $sessionId, status: $status, statusText: $statusText)';
  }
}
