// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  int get id => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  ProductInfo? get productInfo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get buysell => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  int get orderTypeId => throw _privateConstructorUsedError;
  String get counterParty => throw _privateConstructorUsedError;
  bool get transfered => throw _privateConstructorUsedError;
  double get fxRate => throw _privateConstructorUsedError;
  double get nettFxRate => throw _privateConstructorUsedError;
  double get grossFxRate => throw _privateConstructorUsedError;
  double get autoFxFeeInBaseCurrency => throw _privateConstructorUsedError;
  double get totalInBaseCurrency => throw _privateConstructorUsedError;
  double get feeInBaseCurrency => throw _privateConstructorUsedError;
  double get totalFeesInBaseCurrency => throw _privateConstructorUsedError;
  double get totalPlusFeeInBaseCurrency => throw _privateConstructorUsedError;
  double get totalPlusAllFeesInBaseCurrency =>
      throw _privateConstructorUsedError;
  int get transactionTypeId => throw _privateConstructorUsedError;
  String get tradingVenue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int productId,
      ProductInfo? productInfo,
      DateTime date,
      String buysell,
      double price,
      int quantity,
      double total,
      int orderTypeId,
      String counterParty,
      bool transfered,
      double fxRate,
      double nettFxRate,
      double grossFxRate,
      double autoFxFeeInBaseCurrency,
      double totalInBaseCurrency,
      double feeInBaseCurrency,
      double totalFeesInBaseCurrency,
      double totalPlusFeeInBaseCurrency,
      double totalPlusAllFeesInBaseCurrency,
      int transactionTypeId,
      String tradingVenue});

  $ProductInfoCopyWith<$Res>? get productInfo;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productInfo = freezed,
    Object? date = freezed,
    Object? buysell = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? orderTypeId = freezed,
    Object? counterParty = freezed,
    Object? transfered = freezed,
    Object? fxRate = freezed,
    Object? nettFxRate = freezed,
    Object? grossFxRate = freezed,
    Object? autoFxFeeInBaseCurrency = freezed,
    Object? totalInBaseCurrency = freezed,
    Object? feeInBaseCurrency = freezed,
    Object? totalFeesInBaseCurrency = freezed,
    Object? totalPlusFeeInBaseCurrency = freezed,
    Object? totalPlusAllFeesInBaseCurrency = freezed,
    Object? transactionTypeId = freezed,
    Object? tradingVenue = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productInfo: productInfo == freezed
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as ProductInfo?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      buysell: buysell == freezed
          ? _value.buysell
          : buysell // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderTypeId: orderTypeId == freezed
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      transfered: transfered == freezed
          ? _value.transfered
          : transfered // ignore: cast_nullable_to_non_nullable
              as bool,
      fxRate: fxRate == freezed
          ? _value.fxRate
          : fxRate // ignore: cast_nullable_to_non_nullable
              as double,
      nettFxRate: nettFxRate == freezed
          ? _value.nettFxRate
          : nettFxRate // ignore: cast_nullable_to_non_nullable
              as double,
      grossFxRate: grossFxRate == freezed
          ? _value.grossFxRate
          : grossFxRate // ignore: cast_nullable_to_non_nullable
              as double,
      autoFxFeeInBaseCurrency: autoFxFeeInBaseCurrency == freezed
          ? _value.autoFxFeeInBaseCurrency
          : autoFxFeeInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalInBaseCurrency: totalInBaseCurrency == freezed
          ? _value.totalInBaseCurrency
          : totalInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      feeInBaseCurrency: feeInBaseCurrency == freezed
          ? _value.feeInBaseCurrency
          : feeInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalFeesInBaseCurrency: totalFeesInBaseCurrency == freezed
          ? _value.totalFeesInBaseCurrency
          : totalFeesInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalPlusFeeInBaseCurrency: totalPlusFeeInBaseCurrency == freezed
          ? _value.totalPlusFeeInBaseCurrency
          : totalPlusFeeInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalPlusAllFeesInBaseCurrency: totalPlusAllFeesInBaseCurrency == freezed
          ? _value.totalPlusAllFeesInBaseCurrency
          : totalPlusAllFeesInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      transactionTypeId: transactionTypeId == freezed
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      tradingVenue: tradingVenue == freezed
          ? _value.tradingVenue
          : tradingVenue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ProductInfoCopyWith<$Res>? get productInfo {
    if (_value.productInfo == null) {
      return null;
    }

    return $ProductInfoCopyWith<$Res>(_value.productInfo!, (value) {
      return _then(_value.copyWith(productInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int productId,
      ProductInfo? productInfo,
      DateTime date,
      String buysell,
      double price,
      int quantity,
      double total,
      int orderTypeId,
      String counterParty,
      bool transfered,
      double fxRate,
      double nettFxRate,
      double grossFxRate,
      double autoFxFeeInBaseCurrency,
      double totalInBaseCurrency,
      double feeInBaseCurrency,
      double totalFeesInBaseCurrency,
      double totalPlusFeeInBaseCurrency,
      double totalPlusAllFeesInBaseCurrency,
      int transactionTypeId,
      String tradingVenue});

  @override
  $ProductInfoCopyWith<$Res>? get productInfo;
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, (v) => _then(v as _$_Transaction));

  @override
  _$_Transaction get _value => super._value as _$_Transaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productInfo = freezed,
    Object? date = freezed,
    Object? buysell = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? orderTypeId = freezed,
    Object? counterParty = freezed,
    Object? transfered = freezed,
    Object? fxRate = freezed,
    Object? nettFxRate = freezed,
    Object? grossFxRate = freezed,
    Object? autoFxFeeInBaseCurrency = freezed,
    Object? totalInBaseCurrency = freezed,
    Object? feeInBaseCurrency = freezed,
    Object? totalFeesInBaseCurrency = freezed,
    Object? totalPlusFeeInBaseCurrency = freezed,
    Object? totalPlusAllFeesInBaseCurrency = freezed,
    Object? transactionTypeId = freezed,
    Object? tradingVenue = freezed,
  }) {
    return _then(_$_Transaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productInfo: productInfo == freezed
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as ProductInfo?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      buysell: buysell == freezed
          ? _value.buysell
          : buysell // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderTypeId: orderTypeId == freezed
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      transfered: transfered == freezed
          ? _value.transfered
          : transfered // ignore: cast_nullable_to_non_nullable
              as bool,
      fxRate: fxRate == freezed
          ? _value.fxRate
          : fxRate // ignore: cast_nullable_to_non_nullable
              as double,
      nettFxRate: nettFxRate == freezed
          ? _value.nettFxRate
          : nettFxRate // ignore: cast_nullable_to_non_nullable
              as double,
      grossFxRate: grossFxRate == freezed
          ? _value.grossFxRate
          : grossFxRate // ignore: cast_nullable_to_non_nullable
              as double,
      autoFxFeeInBaseCurrency: autoFxFeeInBaseCurrency == freezed
          ? _value.autoFxFeeInBaseCurrency
          : autoFxFeeInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalInBaseCurrency: totalInBaseCurrency == freezed
          ? _value.totalInBaseCurrency
          : totalInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      feeInBaseCurrency: feeInBaseCurrency == freezed
          ? _value.feeInBaseCurrency
          : feeInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalFeesInBaseCurrency: totalFeesInBaseCurrency == freezed
          ? _value.totalFeesInBaseCurrency
          : totalFeesInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalPlusFeeInBaseCurrency: totalPlusFeeInBaseCurrency == freezed
          ? _value.totalPlusFeeInBaseCurrency
          : totalPlusFeeInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      totalPlusAllFeesInBaseCurrency: totalPlusAllFeesInBaseCurrency == freezed
          ? _value.totalPlusAllFeesInBaseCurrency
          : totalPlusAllFeesInBaseCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      transactionTypeId: transactionTypeId == freezed
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      tradingVenue: tradingVenue == freezed
          ? _value.tradingVenue
          : tradingVenue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction extends _Transaction {
  const _$_Transaction(
      {this.id = invalidIntValue,
      this.productId = invalidIntValue,
      this.productInfo,
      required this.date,
      this.buysell = '',
      this.price = 0,
      this.quantity = 0,
      this.total = 0,
      this.orderTypeId = 0,
      this.counterParty = '',
      this.transfered = false,
      this.fxRate = 0,
      this.nettFxRate = 0,
      this.grossFxRate = 0,
      this.autoFxFeeInBaseCurrency = 0,
      this.totalInBaseCurrency = 0,
      this.feeInBaseCurrency = 0,
      this.totalFeesInBaseCurrency = 0,
      this.totalPlusFeeInBaseCurrency = 0,
      this.totalPlusAllFeesInBaseCurrency = 0,
      this.transactionTypeId = 0,
      this.tradingVenue = ''})
      : super._();

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int productId;
  @override
  final ProductInfo? productInfo;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final String buysell;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final int orderTypeId;
  @override
  @JsonKey()
  final String counterParty;
  @override
  @JsonKey()
  final bool transfered;
  @override
  @JsonKey()
  final double fxRate;
  @override
  @JsonKey()
  final double nettFxRate;
  @override
  @JsonKey()
  final double grossFxRate;
  @override
  @JsonKey()
  final double autoFxFeeInBaseCurrency;
  @override
  @JsonKey()
  final double totalInBaseCurrency;
  @override
  @JsonKey()
  final double feeInBaseCurrency;
  @override
  @JsonKey()
  final double totalFeesInBaseCurrency;
  @override
  @JsonKey()
  final double totalPlusFeeInBaseCurrency;
  @override
  @JsonKey()
  final double totalPlusAllFeesInBaseCurrency;
  @override
  @JsonKey()
  final int transactionTypeId;
  @override
  @JsonKey()
  final String tradingVenue;

  @override
  String toString() {
    return 'Transaction(id: $id, productId: $productId, productInfo: $productInfo, date: $date, buysell: $buysell, price: $price, quantity: $quantity, total: $total, orderTypeId: $orderTypeId, counterParty: $counterParty, transfered: $transfered, fxRate: $fxRate, nettFxRate: $nettFxRate, grossFxRate: $grossFxRate, autoFxFeeInBaseCurrency: $autoFxFeeInBaseCurrency, totalInBaseCurrency: $totalInBaseCurrency, feeInBaseCurrency: $feeInBaseCurrency, totalFeesInBaseCurrency: $totalFeesInBaseCurrency, totalPlusFeeInBaseCurrency: $totalPlusFeeInBaseCurrency, totalPlusAllFeesInBaseCurrency: $totalPlusAllFeesInBaseCurrency, transactionTypeId: $transactionTypeId, tradingVenue: $tradingVenue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality()
                .equals(other.productInfo, productInfo) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.buysell, buysell) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other.orderTypeId, orderTypeId) &&
            const DeepCollectionEquality()
                .equals(other.counterParty, counterParty) &&
            const DeepCollectionEquality()
                .equals(other.transfered, transfered) &&
            const DeepCollectionEquality().equals(other.fxRate, fxRate) &&
            const DeepCollectionEquality()
                .equals(other.nettFxRate, nettFxRate) &&
            const DeepCollectionEquality()
                .equals(other.grossFxRate, grossFxRate) &&
            const DeepCollectionEquality().equals(
                other.autoFxFeeInBaseCurrency, autoFxFeeInBaseCurrency) &&
            const DeepCollectionEquality()
                .equals(other.totalInBaseCurrency, totalInBaseCurrency) &&
            const DeepCollectionEquality()
                .equals(other.feeInBaseCurrency, feeInBaseCurrency) &&
            const DeepCollectionEquality().equals(
                other.totalFeesInBaseCurrency, totalFeesInBaseCurrency) &&
            const DeepCollectionEquality().equals(
                other.totalPlusFeeInBaseCurrency, totalPlusFeeInBaseCurrency) &&
            const DeepCollectionEquality().equals(
                other.totalPlusAllFeesInBaseCurrency,
                totalPlusAllFeesInBaseCurrency) &&
            const DeepCollectionEquality()
                .equals(other.transactionTypeId, transactionTypeId) &&
            const DeepCollectionEquality()
                .equals(other.tradingVenue, tradingVenue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(productId),
        const DeepCollectionEquality().hash(productInfo),
        const DeepCollectionEquality().hash(date),
        const DeepCollectionEquality().hash(buysell),
        const DeepCollectionEquality().hash(price),
        const DeepCollectionEquality().hash(quantity),
        const DeepCollectionEquality().hash(total),
        const DeepCollectionEquality().hash(orderTypeId),
        const DeepCollectionEquality().hash(counterParty),
        const DeepCollectionEquality().hash(transfered),
        const DeepCollectionEquality().hash(fxRate),
        const DeepCollectionEquality().hash(nettFxRate),
        const DeepCollectionEquality().hash(grossFxRate),
        const DeepCollectionEquality().hash(autoFxFeeInBaseCurrency),
        const DeepCollectionEquality().hash(totalInBaseCurrency),
        const DeepCollectionEquality().hash(feeInBaseCurrency),
        const DeepCollectionEquality().hash(totalFeesInBaseCurrency),
        const DeepCollectionEquality().hash(totalPlusFeeInBaseCurrency),
        const DeepCollectionEquality().hash(totalPlusAllFeesInBaseCurrency),
        const DeepCollectionEquality().hash(transactionTypeId),
        const DeepCollectionEquality().hash(tradingVenue)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
      {final int id,
      final int productId,
      final ProductInfo? productInfo,
      required final DateTime date,
      final String buysell,
      final double price,
      final int quantity,
      final double total,
      final int orderTypeId,
      final String counterParty,
      final bool transfered,
      final double fxRate,
      final double nettFxRate,
      final double grossFxRate,
      final double autoFxFeeInBaseCurrency,
      final double totalInBaseCurrency,
      final double feeInBaseCurrency,
      final double totalFeesInBaseCurrency,
      final double totalPlusFeeInBaseCurrency,
      final double totalPlusAllFeesInBaseCurrency,
      final int transactionTypeId,
      final String tradingVenue}) = _$_Transaction;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  int get id;
  @override
  int get productId;
  @override
  ProductInfo? get productInfo;
  @override
  DateTime get date;
  @override
  String get buysell;
  @override
  double get price;
  @override
  int get quantity;
  @override
  double get total;
  @override
  int get orderTypeId;
  @override
  String get counterParty;
  @override
  bool get transfered;
  @override
  double get fxRate;
  @override
  double get nettFxRate;
  @override
  double get grossFxRate;
  @override
  double get autoFxFeeInBaseCurrency;
  @override
  double get totalInBaseCurrency;
  @override
  double get feeInBaseCurrency;
  @override
  double get totalFeesInBaseCurrency;
  @override
  double get totalPlusFeeInBaseCurrency;
  @override
  double get totalPlusAllFeesInBaseCurrency;
  @override
  int get transactionTypeId;
  @override
  String get tradingVenue;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
