import 'dart:convert';

import 'package:degiro_api/src/config/constants.dart';

class AccountInfo {
  final int id;
  final int intAccount;
  final int loggedInPersonId;
  final String clientRole;
  final String effectiveClientRole;
  final String contractType;
  final String username;
  final String displayName;
  final String email;
  final _FirstContact firstContact;
  final _Address address;
  final String cellphoneNumber;
  final String locale;
  final String language;
  final String culture;
  final String displayLanguage;
  final _BankAccount bankAccount;
  final _FlatexBankAccount flatexBankAccount;
  final String memberCode;
  final bool isWithdrawalAvailable;
  final bool isAllocationAvailable;
  final bool isIskClient;
  final bool isCollectivePortfolio;
  final bool isAmClientActive;
  final bool canUpgrade;

  AccountInfo({
    required this.id,
    required this.intAccount,
    required this.loggedInPersonId,
    required this.clientRole,
    required this.effectiveClientRole,
    required this.contractType,
    required this.username,
    required this.displayName,
    required this.email,
    required this.firstContact,
    required this.address,
    required this.cellphoneNumber,
    required this.locale,
    required this.language,
    required this.culture,
    required this.displayLanguage,
    required this.bankAccount,
    required this.flatexBankAccount,
    required this.memberCode,
    required this.isWithdrawalAvailable,
    required this.isAllocationAvailable,
    required this.isIskClient,
    required this.isCollectivePortfolio,
    required this.isAmClientActive,
    required this.canUpgrade,
  });

  factory AccountInfo.init() => AccountInfo(
        id: invalidIntValue,
        intAccount: invalidIntValue,
        loggedInPersonId: invalidIntValue,
        clientRole: '',
        effectiveClientRole: '',
        contractType: '',
        username: '',
        displayName: '',
        email: '',
        firstContact: _FirstContact.init(),
        address: _Address.init(),
        cellphoneNumber: '',
        locale: '',
        language: '',
        culture: '',
        displayLanguage: '',
        bankAccount: _BankAccount.init(),
        flatexBankAccount: _FlatexBankAccount.init(),
        memberCode: '',
        isWithdrawalAvailable: false,
        isAllocationAvailable: false,
        isIskClient: false,
        isCollectivePortfolio: false,
        isAmClientActive: false,
        canUpgrade: false,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'intAccount': intAccount,
      'loggedInPersonId': loggedInPersonId,
      'clientRole': clientRole,
      'effectiveClientRole': effectiveClientRole,
      'contractType': contractType,
      'username': username,
      'displayName': displayName,
      'email': email,
      'firstContact': firstContact.toMap(),
      'address': address.toMap(),
      'cellphoneNumber': cellphoneNumber,
      'locale': locale,
      'language': language,
      'culture': culture,
      'displayLanguage': displayLanguage,
      'bankAccount': bankAccount.toMap(),
      'flatexBankAccount': flatexBankAccount.toMap(),
      'memberCode': memberCode,
      'isWithdrawalAvailable': isWithdrawalAvailable,
      'isAllocationAvailable': isAllocationAvailable,
      'isIskClient': isIskClient,
      'isCollectivePortfolio': isCollectivePortfolio,
      'isAmClientActive': isAmClientActive,
      'canUpgrade': canUpgrade,
    };
  }

  factory AccountInfo.fromMap(Map<String, dynamic> map) {
    return AccountInfo(
      id: map['id']?.toInt() ?? invalidIntValue,
      intAccount: map['intAccount']?.toInt() ?? invalidIntValue,
      loggedInPersonId: map['loggedInPersonId']?.toInt() ?? invalidIntValue,
      clientRole: map['clientRole'] ?? '',
      effectiveClientRole: map['effectiveClientRole'] ?? '',
      contractType: map['contractType'] ?? '',
      username: map['username'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      firstContact: _FirstContact.fromMap(map['firstContact']),
      address: _Address.fromMap(map['address']),
      cellphoneNumber: map['cellphoneNumber'] ?? '',
      locale: map['locale'] ?? '',
      language: map['language'] ?? '',
      culture: map['culture'] ?? '',
      displayLanguage: map['displayLanguage'] ?? '',
      bankAccount: _BankAccount.fromMap(map['bankAccount']),
      flatexBankAccount: _FlatexBankAccount.fromMap(map['flatexBankAccount']),
      memberCode: map['memberCode'] ?? '',
      isWithdrawalAvailable: map['isWithdrawalAvailable'] ?? false,
      isAllocationAvailable: map['isAllocationAvailable'] ?? false,
      isIskClient: map['isIskClient'] ?? false,
      isCollectivePortfolio: map['isCollectivePortfolio'] ?? false,
      isAmClientActive: map['isAmClientActive'] ?? false,
      canUpgrade: map['canUpgrade'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());
}

class _FirstContact {
  final String firstName;
  final String lastName;
  final String displayName;
  final String nationality;
  final String gender;
  final String dateOfBirth;
  final String placeOfBirth;
  final String countryOfBirth;

  _FirstContact({
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.nationality,
    required this.gender,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.countryOfBirth,
  });

  factory _FirstContact.init() => _FirstContact(
        firstName: '',
        lastName: '',
        displayName: '',
        nationality: '',
        gender: '',
        dateOfBirth: '',
        placeOfBirth: '',
        countryOfBirth: '',
      );

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'displayName': displayName,
      'nationality': nationality,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'placeOfBirth': placeOfBirth,
      'countryOfBirth': countryOfBirth,
    };
  }

  factory _FirstContact.fromMap(Map<String, dynamic> map) {
    return _FirstContact(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      displayName: map['displayName'] ?? '',
      nationality: map['nationality'] ?? '',
      gender: map['gender'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      placeOfBirth: map['placeOfBirth'] ?? '',
      countryOfBirth: map['countryOfBirth'] ?? '',
    );
  }
}

class _Address {
  final String streetAddress;
  final String streetAddressNumber;
  final String zip;
  final String city;
  final String country;

  _Address({
    required this.streetAddress,
    required this.streetAddressNumber,
    required this.zip,
    required this.city,
    required this.country,
  });

  factory _Address.init() => _Address(
        streetAddress: '',
        streetAddressNumber: '',
        zip: '',
        city: '',
        country: '',
      );

  Map<String, dynamic> toMap() {
    return {
      'streetAddress': streetAddress,
      'streetAddressNumber': streetAddressNumber,
      'zip': zip,
      'city': city,
      'country': country,
    };
  }

  factory _Address.fromMap(Map<String, dynamic> map) {
    return _Address(
      streetAddress: map['streetAddress'] ?? '',
      streetAddressNumber: map['streetAddressNumber'] ?? '',
      zip: map['zip'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
    );
  }

  @override
  String toString() {
    return '_Address(streetAddress: $streetAddress, streetAddressNumber: $streetAddressNumber, zip: $zip, city: $city, country: $country)';
  }
}

class _BankAccount {
  final int bankAccountId;
  final String bic;
  final String iban;
  final String status;

  _BankAccount({
    required this.bankAccountId,
    required this.bic,
    required this.iban,
    required this.status,
  });

  factory _BankAccount.init() => _BankAccount(
        bankAccountId: invalidIntValue,
        bic: '',
        iban: '',
        status: '',
      );

  Map<String, dynamic> toMap() {
    return {
      'bankAccountId': bankAccountId,
      'bic': bic,
      'iban': iban,
      'status': status,
    };
  }

  factory _BankAccount.fromMap(Map<String, dynamic> map) {
    return _BankAccount(
      bankAccountId: map['bankAccountId']?.toInt() ?? invalidIntValue,
      bic: map['bic'] ?? '',
      iban: map['iban'] ?? '',
      status: map['status'] ?? '',
    );
  }
}

class _FlatexBankAccount {
  final String bic;
  final String iban;

  _FlatexBankAccount({
    required this.bic,
    required this.iban,
  });

  factory _FlatexBankAccount.init() => _FlatexBankAccount(bic: '', iban: '');

  Map<String, dynamic> toMap() {
    return {
      'bic': bic,
      'iban': iban,
    };
  }

  factory _FlatexBankAccount.fromMap(Map<String, dynamic> map) {
    return _FlatexBankAccount(
      bic: map['bic'] ?? '',
      iban: map['iban'] ?? '',
    );
  }
}
