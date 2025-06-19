// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'java_script_injection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JavaScriptInjection _$JavaScriptInjectionFromJson(Map<String, dynamic> json) =>
    _JavaScriptInjection(
      name: json['name'] as String,
      script: json['script'] as String,
      injectionTime:
          $enumDecodeNullable(
            _$JavaScriptInjectionTimeEnumMap,
            json['injectionTime'],
          ) ??
          JavaScriptInjectionTime.onPageFinished,
      enabled: json['enabled'] as bool? ?? true,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$JavaScriptInjectionToJson(
  _JavaScriptInjection instance,
) => <String, dynamic>{
  'name': instance.name,
  'script': instance.script,
  'injectionTime': _$JavaScriptInjectionTimeEnumMap[instance.injectionTime]!,
  'enabled': instance.enabled,
  'description': instance.description,
};

const _$JavaScriptInjectionTimeEnumMap = {
  JavaScriptInjectionTime.onPageStarted: 'onPageStarted',
  JavaScriptInjectionTime.onPageFinished: 'onPageFinished',
  JavaScriptInjectionTime.onDomContentLoaded: 'onDomContentLoaded',
};
