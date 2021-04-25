import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_sealed.freezed.dart';
part 'user_sealed.g.dart';

@freezed
abstract class  User implements _$User{
  const User._();
  const factory User.familia({ required String name, required bool esSocio  }) = _Familia;
  const factory User.monitor({ required String name }) = _Monitor;
  const factory User.autorizado({ required String name, required bool tieneAutorizacion }) = _Autorizado;

  factory User.fromJson(Map <String, dynamic> json ) => _$UserFromJson(json);
}