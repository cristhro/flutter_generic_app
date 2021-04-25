// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'familia':
      return _Familia.fromJson(json);
    case 'monitor':
      return _Monitor.fromJson(json);
    case 'autorizado':
      return _Autorizado.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _Familia familia({required String name, required bool esSocio}) {
    return _Familia(
      name: name,
      esSocio: esSocio,
    );
  }

  _Monitor monitor({required String name}) {
    return _Monitor(
      name: name,
    );
  }

  _Autorizado autorizado(
      {required String name, required bool tieneAutorizacion}) {
    return _Autorizado(
      name: name,
      tieneAutorizacion: tieneAutorizacion,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get name => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool esSocio) familia,
    required TResult Function(String name) monitor,
    required TResult Function(String name, bool tieneAutorizacion) autorizado,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool esSocio)? familia,
    TResult Function(String name)? monitor,
    TResult Function(String name, bool tieneAutorizacion)? autorizado,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Familia value) familia,
    required TResult Function(_Monitor value) monitor,
    required TResult Function(_Autorizado value) autorizado,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Familia value)? familia,
    TResult Function(_Monitor value)? monitor,
    TResult Function(_Autorizado value)? autorizado,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FamiliaCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$FamiliaCopyWith(_Familia value, $Res Function(_Familia) then) =
      __$FamiliaCopyWithImpl<$Res>;
  @override
  $Res call({String name, bool esSocio});
}

/// @nodoc
class __$FamiliaCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$FamiliaCopyWith<$Res> {
  __$FamiliaCopyWithImpl(_Familia _value, $Res Function(_Familia) _then)
      : super(_value, (v) => _then(v as _Familia));

  @override
  _Familia get _value => super._value as _Familia;

  @override
  $Res call({
    Object? name = freezed,
    Object? esSocio = freezed,
  }) {
    return _then(_Familia(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      esSocio: esSocio == freezed
          ? _value.esSocio
          : esSocio // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Familia extends _Familia {
  const _$_Familia({required this.name, required this.esSocio}) : super._();

  factory _$_Familia.fromJson(Map<String, dynamic> json) =>
      _$_$_FamiliaFromJson(json);

  @override
  final String name;
  @override
  final bool esSocio;

  @override
  String toString() {
    return 'User.familia(name: $name, esSocio: $esSocio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Familia &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.esSocio, esSocio) ||
                const DeepCollectionEquality().equals(other.esSocio, esSocio)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(esSocio);

  @JsonKey(ignore: true)
  @override
  _$FamiliaCopyWith<_Familia> get copyWith =>
      __$FamiliaCopyWithImpl<_Familia>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool esSocio) familia,
    required TResult Function(String name) monitor,
    required TResult Function(String name, bool tieneAutorizacion) autorizado,
  }) {
    return familia(name, esSocio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool esSocio)? familia,
    TResult Function(String name)? monitor,
    TResult Function(String name, bool tieneAutorizacion)? autorizado,
    required TResult orElse(),
  }) {
    if (familia != null) {
      return familia(name, esSocio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Familia value) familia,
    required TResult Function(_Monitor value) monitor,
    required TResult Function(_Autorizado value) autorizado,
  }) {
    return familia(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Familia value)? familia,
    TResult Function(_Monitor value)? monitor,
    TResult Function(_Autorizado value)? autorizado,
    required TResult orElse(),
  }) {
    if (familia != null) {
      return familia(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FamiliaToJson(this)..['runtimeType'] = 'familia';
  }
}

abstract class _Familia extends User {
  const factory _Familia({required String name, required bool esSocio}) =
      _$_Familia;
  const _Familia._() : super._();

  factory _Familia.fromJson(Map<String, dynamic> json) = _$_Familia.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  bool get esSocio => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FamiliaCopyWith<_Familia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$MonitorCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$MonitorCopyWith(_Monitor value, $Res Function(_Monitor) then) =
      __$MonitorCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$MonitorCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$MonitorCopyWith<$Res> {
  __$MonitorCopyWithImpl(_Monitor _value, $Res Function(_Monitor) _then)
      : super(_value, (v) => _then(v as _Monitor));

  @override
  _Monitor get _value => super._value as _Monitor;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_Monitor(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Monitor extends _Monitor {
  const _$_Monitor({required this.name}) : super._();

  factory _$_Monitor.fromJson(Map<String, dynamic> json) =>
      _$_$_MonitorFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'User.monitor(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Monitor &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$MonitorCopyWith<_Monitor> get copyWith =>
      __$MonitorCopyWithImpl<_Monitor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool esSocio) familia,
    required TResult Function(String name) monitor,
    required TResult Function(String name, bool tieneAutorizacion) autorizado,
  }) {
    return monitor(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool esSocio)? familia,
    TResult Function(String name)? monitor,
    TResult Function(String name, bool tieneAutorizacion)? autorizado,
    required TResult orElse(),
  }) {
    if (monitor != null) {
      return monitor(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Familia value) familia,
    required TResult Function(_Monitor value) monitor,
    required TResult Function(_Autorizado value) autorizado,
  }) {
    return monitor(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Familia value)? familia,
    TResult Function(_Monitor value)? monitor,
    TResult Function(_Autorizado value)? autorizado,
    required TResult orElse(),
  }) {
    if (monitor != null) {
      return monitor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MonitorToJson(this)..['runtimeType'] = 'monitor';
  }
}

abstract class _Monitor extends User {
  const factory _Monitor({required String name}) = _$_Monitor;
  const _Monitor._() : super._();

  factory _Monitor.fromJson(Map<String, dynamic> json) = _$_Monitor.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MonitorCopyWith<_Monitor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AutorizadoCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$AutorizadoCopyWith(
          _Autorizado value, $Res Function(_Autorizado) then) =
      __$AutorizadoCopyWithImpl<$Res>;
  @override
  $Res call({String name, bool tieneAutorizacion});
}

/// @nodoc
class __$AutorizadoCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$AutorizadoCopyWith<$Res> {
  __$AutorizadoCopyWithImpl(
      _Autorizado _value, $Res Function(_Autorizado) _then)
      : super(_value, (v) => _then(v as _Autorizado));

  @override
  _Autorizado get _value => super._value as _Autorizado;

  @override
  $Res call({
    Object? name = freezed,
    Object? tieneAutorizacion = freezed,
  }) {
    return _then(_Autorizado(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tieneAutorizacion: tieneAutorizacion == freezed
          ? _value.tieneAutorizacion
          : tieneAutorizacion // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Autorizado extends _Autorizado {
  const _$_Autorizado({required this.name, required this.tieneAutorizacion})
      : super._();

  factory _$_Autorizado.fromJson(Map<String, dynamic> json) =>
      _$_$_AutorizadoFromJson(json);

  @override
  final String name;
  @override
  final bool tieneAutorizacion;

  @override
  String toString() {
    return 'User.autorizado(name: $name, tieneAutorizacion: $tieneAutorizacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Autorizado &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tieneAutorizacion, tieneAutorizacion) ||
                const DeepCollectionEquality()
                    .equals(other.tieneAutorizacion, tieneAutorizacion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tieneAutorizacion);

  @JsonKey(ignore: true)
  @override
  _$AutorizadoCopyWith<_Autorizado> get copyWith =>
      __$AutorizadoCopyWithImpl<_Autorizado>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool esSocio) familia,
    required TResult Function(String name) monitor,
    required TResult Function(String name, bool tieneAutorizacion) autorizado,
  }) {
    return autorizado(name, tieneAutorizacion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool esSocio)? familia,
    TResult Function(String name)? monitor,
    TResult Function(String name, bool tieneAutorizacion)? autorizado,
    required TResult orElse(),
  }) {
    if (autorizado != null) {
      return autorizado(name, tieneAutorizacion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Familia value) familia,
    required TResult Function(_Monitor value) monitor,
    required TResult Function(_Autorizado value) autorizado,
  }) {
    return autorizado(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Familia value)? familia,
    TResult Function(_Monitor value)? monitor,
    TResult Function(_Autorizado value)? autorizado,
    required TResult orElse(),
  }) {
    if (autorizado != null) {
      return autorizado(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AutorizadoToJson(this)..['runtimeType'] = 'autorizado';
  }
}

abstract class _Autorizado extends User {
  const factory _Autorizado(
      {required String name, required bool tieneAutorizacion}) = _$_Autorizado;
  const _Autorizado._() : super._();

  factory _Autorizado.fromJson(Map<String, dynamic> json) =
      _$_Autorizado.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  bool get tieneAutorizacion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AutorizadoCopyWith<_Autorizado> get copyWith =>
      throw _privateConstructorUsedError;
}
