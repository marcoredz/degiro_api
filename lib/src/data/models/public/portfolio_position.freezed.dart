// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PortfolioPosition _$PortfolioPositionFromJson(Map<String, dynamic> json) {
  return _PortfolioPosition.fromJson(json);
}

/// @nodoc
mixin _$PortfolioPosition {
  /// Id of the portfolio position (NOT of the product)
  String get id => throw _privateConstructorUsedError;
  ProductInfo? get productInfo => throw _privateConstructorUsedError;

  /// Can be 'PRODUCT' or 'CASH'
  String get positionType => throw _privateConstructorUsedError;

  /// The current owned quantity of the product.
  ///
  /// If it is zero, it means the position is closed.
  int get size => throw _privateConstructorUsedError;

  /// Yesterday price or the last price recorded not today.
  ///
  /// To get the real latest price provided by Degiro, use the `closePrice`
  /// property of the [ProductInfo] object.
  double get price => throw _privateConstructorUsedError;

  /// The pre computed by Degiro APIs yesterday value of the position: <br/>
  /// value = price * size.
  ///
  /// You don't see this value on Degiro UI.
  double get value => throw _privateConstructorUsedError;

  /// Total P/L offset value (you don't see this value on Degiro UI)
  /// Used to calculate the `totalPl` property.
  double get plBase => throw _privateConstructorUsedError;

  /// Today P/L offset value (you don't see this value on Degiro UI)
  /// Used to calculate the `todayPl` property.
  double get todayPlBase => throw _privateConstructorUsedError;
  double get breakEvenPrice => throw _privateConstructorUsedError;
  double get realizedProductPl => throw _privateConstructorUsedError;
  double get todayRealizedProductPl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioPositionCopyWith<PortfolioPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioPositionCopyWith<$Res> {
  factory $PortfolioPositionCopyWith(
          PortfolioPosition value, $Res Function(PortfolioPosition) then) =
      _$PortfolioPositionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      ProductInfo? productInfo,
      String positionType,
      int size,
      double price,
      double value,
      double plBase,
      double todayPlBase,
      double breakEvenPrice,
      double realizedProductPl,
      double todayRealizedProductPl});

  $ProductInfoCopyWith<$Res>? get productInfo;
}

/// @nodoc
class _$PortfolioPositionCopyWithImpl<$Res>
    implements $PortfolioPositionCopyWith<$Res> {
  _$PortfolioPositionCopyWithImpl(this._value, this._then);

  final PortfolioPosition _value;
  // ignore: unused_field
  final $Res Function(PortfolioPosition) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productInfo = freezed,
    Object? positionType = freezed,
    Object? size = freezed,
    Object? price = freezed,
    Object? value = freezed,
    Object? plBase = freezed,
    Object? todayPlBase = freezed,
    Object? breakEvenPrice = freezed,
    Object? realizedProductPl = freezed,
    Object? todayRealizedProductPl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productInfo: productInfo == freezed
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as ProductInfo?,
      positionType: positionType == freezed
          ? _value.positionType
          : positionType // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      plBase: plBase == freezed
          ? _value.plBase
          : plBase // ignore: cast_nullable_to_non_nullable
              as double,
      todayPlBase: todayPlBase == freezed
          ? _value.todayPlBase
          : todayPlBase // ignore: cast_nullable_to_non_nullable
              as double,
      breakEvenPrice: breakEvenPrice == freezed
          ? _value.breakEvenPrice
          : breakEvenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      realizedProductPl: realizedProductPl == freezed
          ? _value.realizedProductPl
          : realizedProductPl // ignore: cast_nullable_to_non_nullable
              as double,
      todayRealizedProductPl: todayRealizedProductPl == freezed
          ? _value.todayRealizedProductPl
          : todayRealizedProductPl // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$_PortfolioPositionCopyWith<$Res>
    implements $PortfolioPositionCopyWith<$Res> {
  factory _$$_PortfolioPositionCopyWith(_$_PortfolioPosition value,
          $Res Function(_$_PortfolioPosition) then) =
      __$$_PortfolioPositionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      ProductInfo? productInfo,
      String positionType,
      int size,
      double price,
      double value,
      double plBase,
      double todayPlBase,
      double breakEvenPrice,
      double realizedProductPl,
      double todayRealizedProductPl});

  @override
  $ProductInfoCopyWith<$Res>? get productInfo;
}

/// @nodoc
class __$$_PortfolioPositionCopyWithImpl<$Res>
    extends _$PortfolioPositionCopyWithImpl<$Res>
    implements _$$_PortfolioPositionCopyWith<$Res> {
  __$$_PortfolioPositionCopyWithImpl(
      _$_PortfolioPosition _value, $Res Function(_$_PortfolioPosition) _then)
      : super(_value, (v) => _then(v as _$_PortfolioPosition));

  @override
  _$_PortfolioPosition get _value => super._value as _$_PortfolioPosition;

  @override
  $Res call({
    Object? id = freezed,
    Object? productInfo = freezed,
    Object? positionType = freezed,
    Object? size = freezed,
    Object? price = freezed,
    Object? value = freezed,
    Object? plBase = freezed,
    Object? todayPlBase = freezed,
    Object? breakEvenPrice = freezed,
    Object? realizedProductPl = freezed,
    Object? todayRealizedProductPl = freezed,
  }) {
    return _then(_$_PortfolioPosition(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productInfo: productInfo == freezed
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as ProductInfo?,
      positionType: positionType == freezed
          ? _value.positionType
          : positionType // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      plBase: plBase == freezed
          ? _value.plBase
          : plBase // ignore: cast_nullable_to_non_nullable
              as double,
      todayPlBase: todayPlBase == freezed
          ? _value.todayPlBase
          : todayPlBase // ignore: cast_nullable_to_non_nullable
              as double,
      breakEvenPrice: breakEvenPrice == freezed
          ? _value.breakEvenPrice
          : breakEvenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      realizedProductPl: realizedProductPl == freezed
          ? _value.realizedProductPl
          : realizedProductPl // ignore: cast_nullable_to_non_nullable
              as double,
      todayRealizedProductPl: todayRealizedProductPl == freezed
          ? _value.todayRealizedProductPl
          : todayRealizedProductPl // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PortfolioPosition extends _PortfolioPosition {
  const _$_PortfolioPosition(
      {required this.id,
      this.productInfo,
      this.positionType = '',
      this.size = 0,
      this.price = 0,
      this.value = 0,
      this.plBase = 0,
      this.todayPlBase = 0,
      this.breakEvenPrice = 0,
      this.realizedProductPl = 0,
      this.todayRealizedProductPl = 0})
      : super._();

  factory _$_PortfolioPosition.fromJson(Map<String, dynamic> json) =>
      _$$_PortfolioPositionFromJson(json);

  /// Id of the portfolio position (NOT of the product)
  @override
  final String id;
  @override
  final ProductInfo? productInfo;

  /// Can be 'PRODUCT' or 'CASH'
  @override
  @JsonKey()
  final String positionType;

  /// The current owned quantity of the product.
  ///
  /// If it is zero, it means the position is closed.
  @override
  @JsonKey()
  final int size;

  /// Yesterday price or the last price recorded not today.
  ///
  /// To get the real latest price provided by Degiro, use the `closePrice`
  /// property of the [ProductInfo] object.
  @override
  @JsonKey()
  final double price;

  /// The pre computed by Degiro APIs yesterday value of the position: <br/>
  /// value = price * size.
  ///
  /// You don't see this value on Degiro UI.
  @override
  @JsonKey()
  final double value;

  /// Total P/L offset value (you don't see this value on Degiro UI)
  /// Used to calculate the `totalPl` property.
  @override
  @JsonKey()
  final double plBase;

  /// Today P/L offset value (you don't see this value on Degiro UI)
  /// Used to calculate the `todayPl` property.
  @override
  @JsonKey()
  final double todayPlBase;
  @override
  @JsonKey()
  final double breakEvenPrice;
  @override
  @JsonKey()
  final double realizedProductPl;
  @override
  @JsonKey()
  final double todayRealizedProductPl;

  @override
  String toString() {
    return 'PortfolioPosition(id: $id, productInfo: $productInfo, positionType: $positionType, size: $size, price: $price, value: $value, plBase: $plBase, todayPlBase: $todayPlBase, breakEvenPrice: $breakEvenPrice, realizedProductPl: $realizedProductPl, todayRealizedProductPl: $todayRealizedProductPl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioPosition &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.productInfo, productInfo) &&
            const DeepCollectionEquality()
                .equals(other.positionType, positionType) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.plBase, plBase) &&
            const DeepCollectionEquality()
                .equals(other.todayPlBase, todayPlBase) &&
            const DeepCollectionEquality()
                .equals(other.breakEvenPrice, breakEvenPrice) &&
            const DeepCollectionEquality()
                .equals(other.realizedProductPl, realizedProductPl) &&
            const DeepCollectionEquality()
                .equals(other.todayRealizedProductPl, todayRealizedProductPl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productInfo),
      const DeepCollectionEquality().hash(positionType),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(plBase),
      const DeepCollectionEquality().hash(todayPlBase),
      const DeepCollectionEquality().hash(breakEvenPrice),
      const DeepCollectionEquality().hash(realizedProductPl),
      const DeepCollectionEquality().hash(todayRealizedProductPl));

  @JsonKey(ignore: true)
  @override
  _$$_PortfolioPositionCopyWith<_$_PortfolioPosition> get copyWith =>
      __$$_PortfolioPositionCopyWithImpl<_$_PortfolioPosition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PortfolioPositionToJson(
      this,
    );
  }
}

abstract class _PortfolioPosition extends PortfolioPosition {
  const factory _PortfolioPosition(
      {required final String id,
      final ProductInfo? productInfo,
      final String positionType,
      final int size,
      final double price,
      final double value,
      final double plBase,
      final double todayPlBase,
      final double breakEvenPrice,
      final double realizedProductPl,
      final double todayRealizedProductPl}) = _$_PortfolioPosition;
  const _PortfolioPosition._() : super._();

  factory _PortfolioPosition.fromJson(Map<String, dynamic> json) =
      _$_PortfolioPosition.fromJson;

  @override

  /// Id of the portfolio position (NOT of the product)
  String get id;
  @override
  ProductInfo? get productInfo;
  @override

  /// Can be 'PRODUCT' or 'CASH'
  String get positionType;
  @override

  /// The current owned quantity of the product.
  ///
  /// If it is zero, it means the position is closed.
  int get size;
  @override

  /// Yesterday price or the last price recorded not today.
  ///
  /// To get the real latest price provided by Degiro, use the `closePrice`
  /// property of the [ProductInfo] object.
  double get price;
  @override

  /// The pre computed by Degiro APIs yesterday value of the position: <br/>
  /// value = price * size.
  ///
  /// You don't see this value on Degiro UI.
  double get value;
  @override

  /// Total P/L offset value (you don't see this value on Degiro UI)
  /// Used to calculate the `totalPl` property.
  double get plBase;
  @override

  /// Today P/L offset value (you don't see this value on Degiro UI)
  /// Used to calculate the `todayPl` property.
  double get todayPlBase;
  @override
  double get breakEvenPrice;
  @override
  double get realizedProductPl;
  @override
  double get todayRealizedProductPl;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioPositionCopyWith<_$_PortfolioPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
