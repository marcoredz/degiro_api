// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      isPassCodeEnabled: json['isPassCodeEnabled'] as bool? ?? false,
      locale: json['locale'] as String? ?? '',
      redirectUrl: json['redirectUrl'] as String? ?? '',
      sessionId: json['sessionId'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      statusText: json['statusText'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'isPassCodeEnabled': instance.isPassCodeEnabled,
      'locale': instance.locale,
      'redirectUrl': instance.redirectUrl,
      'sessionId': instance.sessionId,
      'status': instance.status,
      'statusText': instance.statusText,
    };
