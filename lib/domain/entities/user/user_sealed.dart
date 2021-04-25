import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_sealed.freezed.dart';

@freezed
abstract class  User with _$User{
  const factory User.familia({ required String name }) = _Familia;
  const factory User.monitor({ required String name }) = _Monitor;
  const factory User.autorizado({ required String name }) = _Autorizado;

}