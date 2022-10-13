import 'package:degiro_api/src/config/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_info.freezed.dart';
part 'account_info.g.dart';

@freezed
class AccountInfo with _$AccountInfo {
  const factory AccountInfo({
    @Default(invalidIntValue) int id,
    @Default(invalidIntValue) int intAccount,
    @Default(invalidIntValue) int loggedInPersonId,
    @Default('') String clientRole,
    @Default('') String effectiveClientRole,
    @Default('') String contractType,
    @Default('') String username,
    @Default('') String displayName,
    @Default('') String email,
    _FirstContact? firstContact,
    _Address? address,
    @Default('') String cellphoneNumber,
    @Default('') String locale,
    @Default('') String language,
    @Default('') String culture,
    @Default('') String displayLanguage,
    _BankAccount? bankAccount,
    _FlatexBankAccount? flatexBankAccount,
    @Default('') String memberCode,
    @Default(false) bool isWithdrawalAvailable,
    @Default(false) bool isAllocationAvailable,
    @Default(false) bool isIskClient,
    @Default(false) bool isCollectivePortfolio,
    @Default(false) bool isAmClientActive,
    @Default(false) bool canUpgrade,
  }) = _AccountInfo;

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

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);
}

@JsonSerializable()
class _FirstContact {
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String displayName;
  @JsonKey(defaultValue: '')
  final String nationality;
  @JsonKey(defaultValue: '')
  final String gender;
  @JsonKey(defaultValue: '')
  final String dateOfBirth;
  @JsonKey(defaultValue: '')
  final String placeOfBirth;
  @JsonKey(defaultValue: '')
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

  factory _FirstContact.fromJson(Map<String, dynamic> json) =>
      _$FirstContactFromJson(json);

  Map<String, dynamic> toJson() => _$FirstContactToJson(this);
}

@JsonSerializable()
class _Address {
  @JsonKey(defaultValue: '')
  final String streetAddress;
  @JsonKey(defaultValue: '')
  final String streetAddressNumber;
  @JsonKey(defaultValue: '')
  final String zip;
  @JsonKey(defaultValue: '')
  final String city;
  @JsonKey(defaultValue: '')
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

  factory _Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class _BankAccount {
  @JsonKey(defaultValue: invalidIntValue)
  final int bankAccountId;
  @JsonKey(defaultValue: '')
  final String bic;
  @JsonKey(defaultValue: '')
  final String iban;
  @JsonKey(defaultValue: '')
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

  factory _BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}

@JsonSerializable()
class _FlatexBankAccount {
  @JsonKey(defaultValue: '')
  final String bic;
  @JsonKey(defaultValue: '')
  final String iban;

  _FlatexBankAccount({
    required this.bic,
    required this.iban,
  });

  factory _FlatexBankAccount.init() => _FlatexBankAccount(bic: '', iban: '');

  factory _FlatexBankAccount.fromJson(Map<String, dynamic> json) =>
      _$FlatexBankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$FlatexBankAccountToJson(this);
}
