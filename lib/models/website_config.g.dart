// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WebsiteConfig _$WebsiteConfigFromJson(Map<String, dynamic> json) =>
    _WebsiteConfig(
      url: json['url'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      enableJavaScript: json['enableJavaScript'] as bool? ?? true,
      enableDomStorage: json['enableDomStorage'] as bool? ?? true,
      debuggingEnabled: json['debuggingEnabled'] as bool? ?? false,
      userAgent: json['userAgent'] as String? ?? '',
      injectedScripts:
          (json['injectedScripts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      customHeaders:
          (json['customHeaders'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$WebsiteConfigToJson(_WebsiteConfig instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'enableJavaScript': instance.enableJavaScript,
      'enableDomStorage': instance.enableDomStorage,
      'debuggingEnabled': instance.debuggingEnabled,
      'userAgent': instance.userAgent,
      'injectedScripts': instance.injectedScripts,
      'customHeaders': instance.customHeaders,
    };
