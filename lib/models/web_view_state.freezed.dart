// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WebViewState {

 String? get currentUrl; String? get title; String? get error; int get progress; bool get isLoading; bool get canGoBack; bool get canGoForward;
/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebViewStateCopyWith<WebViewState> get copyWith => _$WebViewStateCopyWithImpl<WebViewState>(this as WebViewState, _$identity);

  /// Serializes this WebViewState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebViewState&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.error, error) || other.error == error)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentUrl,title,error,progress,isLoading,canGoBack,canGoForward);

@override
String toString() {
  return 'WebViewState(currentUrl: $currentUrl, title: $title, error: $error, progress: $progress, isLoading: $isLoading, canGoBack: $canGoBack, canGoForward: $canGoForward)';
}


}

/// @nodoc
abstract mixin class $WebViewStateCopyWith<$Res>  {
  factory $WebViewStateCopyWith(WebViewState value, $Res Function(WebViewState) _then) = _$WebViewStateCopyWithImpl;
@useResult
$Res call({
 String? currentUrl, String? title, String? error, int progress, bool isLoading, bool canGoBack, bool canGoForward
});




}
/// @nodoc
class _$WebViewStateCopyWithImpl<$Res>
    implements $WebViewStateCopyWith<$Res> {
  _$WebViewStateCopyWithImpl(this._self, this._then);

  final WebViewState _self;
  final $Res Function(WebViewState) _then;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentUrl = freezed,Object? title = freezed,Object? error = freezed,Object? progress = null,Object? isLoading = null,Object? canGoBack = null,Object? canGoForward = null,}) {
  return _then(_self.copyWith(
currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WebViewState implements WebViewState {
  const _WebViewState({this.currentUrl, this.title, this.error, this.progress = 0, this.isLoading = false, this.canGoBack = false, this.canGoForward = false});
  factory _WebViewState.fromJson(Map<String, dynamic> json) => _$WebViewStateFromJson(json);

@override final  String? currentUrl;
@override final  String? title;
@override final  String? error;
@override@JsonKey() final  int progress;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebViewStateCopyWith<_WebViewState> get copyWith => __$WebViewStateCopyWithImpl<_WebViewState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebViewStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebViewState&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.error, error) || other.error == error)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentUrl,title,error,progress,isLoading,canGoBack,canGoForward);

@override
String toString() {
  return 'WebViewState(currentUrl: $currentUrl, title: $title, error: $error, progress: $progress, isLoading: $isLoading, canGoBack: $canGoBack, canGoForward: $canGoForward)';
}


}

/// @nodoc
abstract mixin class _$WebViewStateCopyWith<$Res> implements $WebViewStateCopyWith<$Res> {
  factory _$WebViewStateCopyWith(_WebViewState value, $Res Function(_WebViewState) _then) = __$WebViewStateCopyWithImpl;
@override @useResult
$Res call({
 String? currentUrl, String? title, String? error, int progress, bool isLoading, bool canGoBack, bool canGoForward
});




}
/// @nodoc
class __$WebViewStateCopyWithImpl<$Res>
    implements _$WebViewStateCopyWith<$Res> {
  __$WebViewStateCopyWithImpl(this._self, this._then);

  final _WebViewState _self;
  final $Res Function(_WebViewState) _then;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentUrl = freezed,Object? title = freezed,Object? error = freezed,Object? progress = null,Object? isLoading = null,Object? canGoBack = null,Object? canGoForward = null,}) {
  return _then(_WebViewState(
currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
