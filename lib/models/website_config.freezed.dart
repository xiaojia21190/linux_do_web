// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'website_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WebsiteConfig {

 String get url; String get title; String get description; bool get enableJavaScript; bool get enableDomStorage; bool get debuggingEnabled; String get userAgent; List<String> get injectedScripts; Map<String, String> get customHeaders;
/// Create a copy of WebsiteConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebsiteConfigCopyWith<WebsiteConfig> get copyWith => _$WebsiteConfigCopyWithImpl<WebsiteConfig>(this as WebsiteConfig, _$identity);

  /// Serializes this WebsiteConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsiteConfig&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enableJavaScript, enableJavaScript) || other.enableJavaScript == enableJavaScript)&&(identical(other.enableDomStorage, enableDomStorage) || other.enableDomStorage == enableDomStorage)&&(identical(other.debuggingEnabled, debuggingEnabled) || other.debuggingEnabled == debuggingEnabled)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&const DeepCollectionEquality().equals(other.injectedScripts, injectedScripts)&&const DeepCollectionEquality().equals(other.customHeaders, customHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,title,description,enableJavaScript,enableDomStorage,debuggingEnabled,userAgent,const DeepCollectionEquality().hash(injectedScripts),const DeepCollectionEquality().hash(customHeaders));

@override
String toString() {
  return 'WebsiteConfig(url: $url, title: $title, description: $description, enableJavaScript: $enableJavaScript, enableDomStorage: $enableDomStorage, debuggingEnabled: $debuggingEnabled, userAgent: $userAgent, injectedScripts: $injectedScripts, customHeaders: $customHeaders)';
}


}

/// @nodoc
abstract mixin class $WebsiteConfigCopyWith<$Res>  {
  factory $WebsiteConfigCopyWith(WebsiteConfig value, $Res Function(WebsiteConfig) _then) = _$WebsiteConfigCopyWithImpl;
@useResult
$Res call({
 String url, String title, String description, bool enableJavaScript, bool enableDomStorage, bool debuggingEnabled, String userAgent, List<String> injectedScripts, Map<String, String> customHeaders
});




}
/// @nodoc
class _$WebsiteConfigCopyWithImpl<$Res>
    implements $WebsiteConfigCopyWith<$Res> {
  _$WebsiteConfigCopyWithImpl(this._self, this._then);

  final WebsiteConfig _self;
  final $Res Function(WebsiteConfig) _then;

/// Create a copy of WebsiteConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? title = null,Object? description = null,Object? enableJavaScript = null,Object? enableDomStorage = null,Object? debuggingEnabled = null,Object? userAgent = null,Object? injectedScripts = null,Object? customHeaders = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enableJavaScript: null == enableJavaScript ? _self.enableJavaScript : enableJavaScript // ignore: cast_nullable_to_non_nullable
as bool,enableDomStorage: null == enableDomStorage ? _self.enableDomStorage : enableDomStorage // ignore: cast_nullable_to_non_nullable
as bool,debuggingEnabled: null == debuggingEnabled ? _self.debuggingEnabled : debuggingEnabled // ignore: cast_nullable_to_non_nullable
as bool,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,injectedScripts: null == injectedScripts ? _self.injectedScripts : injectedScripts // ignore: cast_nullable_to_non_nullable
as List<String>,customHeaders: null == customHeaders ? _self.customHeaders : customHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WebsiteConfig implements WebsiteConfig {
  const _WebsiteConfig({required this.url, required this.title, this.description = '', this.enableJavaScript = true, this.enableDomStorage = true, this.debuggingEnabled = false, this.userAgent = '', final  List<String> injectedScripts = const [], final  Map<String, String> customHeaders = const {}}): _injectedScripts = injectedScripts,_customHeaders = customHeaders;
  factory _WebsiteConfig.fromJson(Map<String, dynamic> json) => _$WebsiteConfigFromJson(json);

@override final  String url;
@override final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  bool enableJavaScript;
@override@JsonKey() final  bool enableDomStorage;
@override@JsonKey() final  bool debuggingEnabled;
@override@JsonKey() final  String userAgent;
 final  List<String> _injectedScripts;
@override@JsonKey() List<String> get injectedScripts {
  if (_injectedScripts is EqualUnmodifiableListView) return _injectedScripts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_injectedScripts);
}

 final  Map<String, String> _customHeaders;
@override@JsonKey() Map<String, String> get customHeaders {
  if (_customHeaders is EqualUnmodifiableMapView) return _customHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customHeaders);
}


/// Create a copy of WebsiteConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebsiteConfigCopyWith<_WebsiteConfig> get copyWith => __$WebsiteConfigCopyWithImpl<_WebsiteConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebsiteConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebsiteConfig&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enableJavaScript, enableJavaScript) || other.enableJavaScript == enableJavaScript)&&(identical(other.enableDomStorage, enableDomStorage) || other.enableDomStorage == enableDomStorage)&&(identical(other.debuggingEnabled, debuggingEnabled) || other.debuggingEnabled == debuggingEnabled)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&const DeepCollectionEquality().equals(other._injectedScripts, _injectedScripts)&&const DeepCollectionEquality().equals(other._customHeaders, _customHeaders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,title,description,enableJavaScript,enableDomStorage,debuggingEnabled,userAgent,const DeepCollectionEquality().hash(_injectedScripts),const DeepCollectionEquality().hash(_customHeaders));

@override
String toString() {
  return 'WebsiteConfig(url: $url, title: $title, description: $description, enableJavaScript: $enableJavaScript, enableDomStorage: $enableDomStorage, debuggingEnabled: $debuggingEnabled, userAgent: $userAgent, injectedScripts: $injectedScripts, customHeaders: $customHeaders)';
}


}

/// @nodoc
abstract mixin class _$WebsiteConfigCopyWith<$Res> implements $WebsiteConfigCopyWith<$Res> {
  factory _$WebsiteConfigCopyWith(_WebsiteConfig value, $Res Function(_WebsiteConfig) _then) = __$WebsiteConfigCopyWithImpl;
@override @useResult
$Res call({
 String url, String title, String description, bool enableJavaScript, bool enableDomStorage, bool debuggingEnabled, String userAgent, List<String> injectedScripts, Map<String, String> customHeaders
});




}
/// @nodoc
class __$WebsiteConfigCopyWithImpl<$Res>
    implements _$WebsiteConfigCopyWith<$Res> {
  __$WebsiteConfigCopyWithImpl(this._self, this._then);

  final _WebsiteConfig _self;
  final $Res Function(_WebsiteConfig) _then;

/// Create a copy of WebsiteConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? title = null,Object? description = null,Object? enableJavaScript = null,Object? enableDomStorage = null,Object? debuggingEnabled = null,Object? userAgent = null,Object? injectedScripts = null,Object? customHeaders = null,}) {
  return _then(_WebsiteConfig(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enableJavaScript: null == enableJavaScript ? _self.enableJavaScript : enableJavaScript // ignore: cast_nullable_to_non_nullable
as bool,enableDomStorage: null == enableDomStorage ? _self.enableDomStorage : enableDomStorage // ignore: cast_nullable_to_non_nullable
as bool,debuggingEnabled: null == debuggingEnabled ? _self.debuggingEnabled : debuggingEnabled // ignore: cast_nullable_to_non_nullable
as bool,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,injectedScripts: null == injectedScripts ? _self._injectedScripts : injectedScripts // ignore: cast_nullable_to_non_nullable
as List<String>,customHeaders: null == customHeaders ? _self._customHeaders : customHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
