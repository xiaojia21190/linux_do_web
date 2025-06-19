// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'java_script_injection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JavaScriptInjection {

 String get name; String get script; JavaScriptInjectionTime get injectionTime; bool get enabled; String get description;
/// Create a copy of JavaScriptInjection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JavaScriptInjectionCopyWith<JavaScriptInjection> get copyWith => _$JavaScriptInjectionCopyWithImpl<JavaScriptInjection>(this as JavaScriptInjection, _$identity);

  /// Serializes this JavaScriptInjection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JavaScriptInjection&&(identical(other.name, name) || other.name == name)&&(identical(other.script, script) || other.script == script)&&(identical(other.injectionTime, injectionTime) || other.injectionTime == injectionTime)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,script,injectionTime,enabled,description);

@override
String toString() {
  return 'JavaScriptInjection(name: $name, script: $script, injectionTime: $injectionTime, enabled: $enabled, description: $description)';
}


}

/// @nodoc
abstract mixin class $JavaScriptInjectionCopyWith<$Res>  {
  factory $JavaScriptInjectionCopyWith(JavaScriptInjection value, $Res Function(JavaScriptInjection) _then) = _$JavaScriptInjectionCopyWithImpl;
@useResult
$Res call({
 String name, String script, JavaScriptInjectionTime injectionTime, bool enabled, String description
});




}
/// @nodoc
class _$JavaScriptInjectionCopyWithImpl<$Res>
    implements $JavaScriptInjectionCopyWith<$Res> {
  _$JavaScriptInjectionCopyWithImpl(this._self, this._then);

  final JavaScriptInjection _self;
  final $Res Function(JavaScriptInjection) _then;

/// Create a copy of JavaScriptInjection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? script = null,Object? injectionTime = null,Object? enabled = null,Object? description = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,script: null == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as String,injectionTime: null == injectionTime ? _self.injectionTime : injectionTime // ignore: cast_nullable_to_non_nullable
as JavaScriptInjectionTime,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _JavaScriptInjection implements JavaScriptInjection {
  const _JavaScriptInjection({required this.name, required this.script, this.injectionTime = JavaScriptInjectionTime.onPageFinished, this.enabled = true, this.description = ''});
  factory _JavaScriptInjection.fromJson(Map<String, dynamic> json) => _$JavaScriptInjectionFromJson(json);

@override final  String name;
@override final  String script;
@override@JsonKey() final  JavaScriptInjectionTime injectionTime;
@override@JsonKey() final  bool enabled;
@override@JsonKey() final  String description;

/// Create a copy of JavaScriptInjection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JavaScriptInjectionCopyWith<_JavaScriptInjection> get copyWith => __$JavaScriptInjectionCopyWithImpl<_JavaScriptInjection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JavaScriptInjectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JavaScriptInjection&&(identical(other.name, name) || other.name == name)&&(identical(other.script, script) || other.script == script)&&(identical(other.injectionTime, injectionTime) || other.injectionTime == injectionTime)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,script,injectionTime,enabled,description);

@override
String toString() {
  return 'JavaScriptInjection(name: $name, script: $script, injectionTime: $injectionTime, enabled: $enabled, description: $description)';
}


}

/// @nodoc
abstract mixin class _$JavaScriptInjectionCopyWith<$Res> implements $JavaScriptInjectionCopyWith<$Res> {
  factory _$JavaScriptInjectionCopyWith(_JavaScriptInjection value, $Res Function(_JavaScriptInjection) _then) = __$JavaScriptInjectionCopyWithImpl;
@override @useResult
$Res call({
 String name, String script, JavaScriptInjectionTime injectionTime, bool enabled, String description
});




}
/// @nodoc
class __$JavaScriptInjectionCopyWithImpl<$Res>
    implements _$JavaScriptInjectionCopyWith<$Res> {
  __$JavaScriptInjectionCopyWithImpl(this._self, this._then);

  final _JavaScriptInjection _self;
  final $Res Function(_JavaScriptInjection) _then;

/// Create a copy of JavaScriptInjection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? script = null,Object? injectionTime = null,Object? enabled = null,Object? description = null,}) {
  return _then(_JavaScriptInjection(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,script: null == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as String,injectionTime: null == injectionTime ? _self.injectionTime : injectionTime // ignore: cast_nullable_to_non_nullable
as JavaScriptInjectionTime,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
