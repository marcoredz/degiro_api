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
    DegiroApiFirstContact? firstContact,
    DegiroApiAddress? address,
    @Default('') String cellphoneNumber,
    @Default('') String locale,
    @Default('') String language,
    @Default('') String culture,
    @Default('') String displayLanguage,
    DegiroApiBankAccount? bankAccount,
    DegiroApiFlatexBankAccount? flatexBankAccount,
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
        firstContact: DegiroApiFirstContact.init(),
        address: DegiroApiAddress.init(),
        cellphoneNumber: '',
        locale: '',
        language: '',
        culture: '',
        displayLanguage: '',
        bankAccount: DegiroApiBankAccount.init(),
        flatexBankAccount: DegiroApiFlatexBankAccount.init(),
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
class DegiroApiFirstContact {
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

  DegiroApiFirstContact({
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.nationality,
    required this.gender,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.countryOfBirth,
  });

  factory DegiroApiFirstContact.init() => DegiroApiFirstContact(
        firstName: '',
        lastName: '',
        displayName: '',
        nationality: '',
        gender: '',
        dateOfBirth: '',
        placeOfBirth: '',
        countryOfBirth: '',
      );

  factory DegiroApiFirstContact.fromJson(Map<String, dynamic> json) =>
      _$DegiroApiFirstContactFromJson(json);

  Map<String, dynamic> toJson() => _$DegiroApiFirstContactToJson(this);
}

@JsonSerializable()
class DegiroApiAddress {
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

  DegiroApiAddress({
    required this.streetAddress,
    required this.streetAddressNumber,
    required this.zip,
    required this.city,
    required this.country,
  });

  factory DegiroApiAddress.init() => DegiroApiAddress(
        streetAddress: '',
        streetAddressNumber: '',
        zip: '',
        city: '',
        country: '',
      );

  factory DegiroApiAddress.fromJson(Map<String, dynamic> json) =>
      _$DegiroApiAddressFromJson(json);

  Map<String, dynamic> toJson() => _$DegiroApiAddressToJson(this);
}

@JsonSerializable()
class DegiroApiBankAccount {
  @JsonKey(defaultValue: invalidIntValue)
  final int bankAccountId;
  @JsonKey(defaultValue: '')
  final String bic;
  @JsonKey(defaultValue: '')
  final String iban;
  @JsonKey(defaultValue: '')
  final String status;

  DegiroApiBankAccount({
    required this.bankAccountId,
    required this.bic,
    required this.iban,
    required this.status,
  });

  factory DegiroApiBankAccount.init() => DegiroApiBankAccount(
        bankAccountId: invalidIntValue,
        bic: '',
        iban: '',
        status: '',
      );

  factory DegiroApiBankAccount.fromJson(Map<String, dynamic> json) =>
      _$DegiroApiBankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$DegiroApiBankAccountToJson(this);
}

@JsonSerializable()
class DegiroApiFlatexBankAccount {
  @JsonKey(defaultValue: '')
  final String bic;
  @JsonKey(defaultValue: '')
  final String iban;

  DegiroApiFlatexBankAccount({
    required this.bic,
    required this.iban,
  });

  factory DegiroApiFlatexBankAccount.init() =>
      DegiroApiFlatexBankAccount(bic: '', iban: '');

  factory DegiroApiFlatexBankAccount.fromJson(Map<String, dynamic> json) =>
      _$DegiroApiFlatexBankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$DegiroApiFlatexBankAccountToJson(this);
}
