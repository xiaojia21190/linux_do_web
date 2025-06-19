import 'package:freezed_annotation/freezed_annotation.dart';
part 'java_script_injection.freezed.dart';
part 'java_script_injection.g.dart';

@freezed
abstract class JavaScriptInjection with _$JavaScriptInjection {
  const factory JavaScriptInjection({required String name, required String script, @Default(JavaScriptInjectionTime.onPageFinished) JavaScriptInjectionTime injectionTime, @Default(true) bool enabled, @Default('') String description}) = _JavaScriptInjection;

  factory JavaScriptInjection.fromJson(Map<String, dynamic> json) => _$JavaScriptInjectionFromJson(json);
}

enum JavaScriptInjectionTime { onPageStarted, onPageFinished, onDomContentLoaded }
