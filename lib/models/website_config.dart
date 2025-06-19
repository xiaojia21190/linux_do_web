import 'package:freezed_annotation/freezed_annotation.dart';

part 'website_config.freezed.dart';
part 'website_config.g.dart';

@freezed
abstract class WebsiteConfig with _$WebsiteConfig {
  const factory WebsiteConfig({
    required String url,
    required String title,
    @Default('') String description,
    @Default(true) bool enableJavaScript,
    @Default(true) bool enableDomStorage,
    @Default(false) bool debuggingEnabled,
    @Default('') String userAgent,
    @Default([]) List<String> injectedScripts,
    @Default({}) Map<String, String> customHeaders,
  }) = _WebsiteConfig;

  factory WebsiteConfig.fromJson(Map<String, dynamic> json) => _$WebsiteConfigFromJson(json);
}
