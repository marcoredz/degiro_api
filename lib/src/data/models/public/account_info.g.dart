// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstContact _$FirstContactFromJson(Map<String, dynamic> json) => FirstContact(
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      placeOfBirth: json['placeOfBirth'] as String? ?? '',
      countryOfBirth: json['countryOfBirth'] as String? ?? '',
    );

Map<String, dynamic> _$FirstContactToJson(FirstContact instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'placeOfBirth': instance.placeOfBirth,
      'countryOfBirth': instance.countryOfBirth,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      streetAddress: json['streetAddress'] as String? ?? '',
      streetAddressNumber: json['streetAddressNumber'] as String? ?? '',
      zip: json['zip'] as String? ?? '',
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'streetAddress': instance.streetAddress,
      'streetAddressNumber': instance.streetAddressNumber,
      'zip': instance.zip,
      'city': instance.city,
      'country': instance.country,
    };

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      bankAccountId: json['bankAccountId'] as int? ?? -1,
      bic: json['bic'] as String? ?? '',
      iban: json['iban'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'bankAccountId': instance.bankAccountId,
      'bic': instance.bic,
      'iban': instance.iban,
      'status': instance.status,
    };

FlatexBankAccount _$FlatexBankAccountFromJson(Map<String, dynamic> json) =>
    FlatexBankAccount(
      bic: json['bic'] as String? ?? '',
      iban: json['iban'] as String? ?? '',
    );

Map<String, dynamic> _$FlatexBankAccountToJson(FlatexBankAccount instance) =>
    <String, dynamic>{
      'bic': instance.bic,
      'iban': instance.iban,
    };

_$_AccountInfo _$$_AccountInfoFromJson(Map<String, dynamic> json) =>
    _$_AccountInfo(
      id: json['id'] as int? ?? invalidIntValue,
      intAccount: json['intAccount'] as int? ?? invalidIntValue,
      loggedInPersonId: json['loggedInPersonId'] as int? ?? invalidIntValue,
      clientRole: json['clientRole'] as String? ?? '',
      effectiveClientRole: json['effectiveClientRole'] as String? ?? '',
      contractType: json['contractType'] as String? ?? '',
      username: json['username'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      firstContact: json['firstContact'] == null
          ? null
          : FirstContact.fromJson(json['firstContact'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      cellphoneNumber: json['cellphoneNumber'] as String? ?? '',
      locale: json['locale'] as String? ?? '',
      language: json['language'] as String? ?? '',
      culture: json['culture'] as String? ?? '',
      displayLanguage: json['displayLanguage'] as String? ?? '',
      bankAccount: json['bankAccount'] == null
          ? null
          : BankAccount.fromJson(json['bankAccount'] as Map<String, dynamic>),
      flatexBankAccount: json['flatexBankAccount'] == null
          ? null
          : FlatexBankAccount.fromJson(
              json['flatexBankAccount'] as Map<String, dynamic>),
      memberCode: json['memberCode'] as String? ?? '',
      isWithdrawalAvailable: json['isWithdrawalAvailable'] as bool? ?? false,
      isAllocationAvailable: json['isAllocationAvailable'] as bool? ?? false,
      isIskClient: json['isIskClient'] as bool? ?? false,
      isCollectivePortfolio: json['isCollectivePortfolio'] as bool? ?? false,
      isAmClientActive: json['isAmClientActive'] as bool? ?? false,
      canUpgrade: json['canUpgrade'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AccountInfoToJson(_$_AccountInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'intAccount': instance.intAccount,
      'loggedInPersonId': instance.loggedInPersonId,
      'clientRole': instance.clientRole,
      'effectiveClientRole': instance.effectiveClientRole,
      'contractType': instance.contractType,
      'username': instance.username,
      'displayName': instance.displayName,
      'email': instance.email,
      'firstContact': instance.firstContact,
      'address': instance.address,
      'cellphoneNumber': instance.cellphoneNumber,
      'locale': instance.locale,
      'language': instance.language,
      'culture': instance.culture,
      'displayLanguage': instance.displayLanguage,
      'bankAccount': instance.bankAccount,
      'flatexBankAccount': instance.flatexBankAccount,
      'memberCode': instance.memberCode,
      'isWithdrawalAvailable': instance.isWithdrawalAvailable,
      'isAllocationAvailable': instance.isAllocationAvailable,
      'isIskClient': instance.isIskClient,
      'isCollectivePortfolio': instance.isCollectivePortfolio,
      'isAmClientActive': instance.isAmClientActive,
      'canUpgrade': instance.canUpgrade,
    };
