// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sealed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Familia _$_$_FamiliaFromJson(Map<String, dynamic> json) {
  return _$_Familia(
    name: json['name'] as String,
    esSocio: json['esSocio'] as bool,
  );
}

Map<String, dynamic> _$_$_FamiliaToJson(_$_Familia instance) =>
    <String, dynamic>{
      'name': instance.name,
      'esSocio': instance.esSocio,
    };

_$_Monitor _$_$_MonitorFromJson(Map<String, dynamic> json) {
  return _$_Monitor(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_MonitorToJson(_$_Monitor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$_Autorizado _$_$_AutorizadoFromJson(Map<String, dynamic> json) {
  return _$_Autorizado(
    name: json['name'] as String,
    tieneAutorizacion: json['tieneAutorizacion'] as bool,
  );
}

Map<String, dynamic> _$_$_AutorizadoToJson(_$_Autorizado instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tieneAutorizacion': instance.tieneAutorizacion,
    };
