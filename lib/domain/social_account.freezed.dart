// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'social_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SocialAccountTearOff {
  const _$SocialAccountTearOff();

  _SocialAccount _default(
      {required Icon icon,
      required String name,
      required String Function(String) prelink,
      required String identifier}) {
    return _SocialAccount(
      icon: icon,
      name: name,
      prelink: prelink,
      identifier: identifier,
    );
  }
}

/// @nodoc
const $SocialAccount = _$SocialAccountTearOff();

/// @nodoc
mixin _$SocialAccount {
  Icon get icon => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String Function(String) get prelink => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocialAccountCopyWith<SocialAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialAccountCopyWith<$Res> {
  factory $SocialAccountCopyWith(
          SocialAccount value, $Res Function(SocialAccount) then) =
      _$SocialAccountCopyWithImpl<$Res>;
  $Res call(
      {Icon icon,
      String name,
      String Function(String) prelink,
      String identifier});
}

/// @nodoc
class _$SocialAccountCopyWithImpl<$Res>
    implements $SocialAccountCopyWith<$Res> {
  _$SocialAccountCopyWithImpl(this._value, this._then);

  final SocialAccount _value;
  // ignore: unused_field
  final $Res Function(SocialAccount) _then;

  @override
  $Res call({
    Object? icon = freezed,
    Object? name = freezed,
    Object? prelink = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      prelink: prelink == freezed
          ? _value.prelink
          : prelink // ignore: cast_nullable_to_non_nullable
              as String Function(String),
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SocialAccountCopyWith<$Res>
    implements $SocialAccountCopyWith<$Res> {
  factory _$SocialAccountCopyWith(
          _SocialAccount value, $Res Function(_SocialAccount) then) =
      __$SocialAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {Icon icon,
      String name,
      String Function(String) prelink,
      String identifier});
}

/// @nodoc
class __$SocialAccountCopyWithImpl<$Res>
    extends _$SocialAccountCopyWithImpl<$Res>
    implements _$SocialAccountCopyWith<$Res> {
  __$SocialAccountCopyWithImpl(
      _SocialAccount _value, $Res Function(_SocialAccount) _then)
      : super(_value, (v) => _then(v as _SocialAccount));

  @override
  _SocialAccount get _value => super._value as _SocialAccount;

  @override
  $Res call({
    Object? icon = freezed,
    Object? name = freezed,
    Object? prelink = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_SocialAccount(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      prelink: prelink == freezed
          ? _value.prelink
          : prelink // ignore: cast_nullable_to_non_nullable
              as String Function(String),
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_SocialAccount extends _SocialAccount {
  _$_SocialAccount(
      {required this.icon,
      required this.name,
      required this.prelink,
      required this.identifier})
      : super._();

  @override
  final Icon icon;
  @override
  final String name;
  @override
  final String Function(String) prelink;
  @override
  final String identifier;

  @override
  String toString() {
    return 'SocialAccount._default(icon: $icon, name: $name, prelink: $prelink, identifier: $identifier)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SocialAccount &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.prelink, prelink) ||
                const DeepCollectionEquality()
                    .equals(other.prelink, prelink)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(prelink) ^
      const DeepCollectionEquality().hash(identifier);

  @JsonKey(ignore: true)
  @override
  _$SocialAccountCopyWith<_SocialAccount> get copyWith =>
      __$SocialAccountCopyWithImpl<_SocialAccount>(this, _$identity);
}

abstract class _SocialAccount extends SocialAccount {
  factory _SocialAccount(
      {required Icon icon,
      required String name,
      required String Function(String) prelink,
      required String identifier}) = _$_SocialAccount;
  _SocialAccount._() : super._();

  @override
  Icon get icon => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String Function(String) get prelink => throw _privateConstructorUsedError;
  @override
  String get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SocialAccountCopyWith<_SocialAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
