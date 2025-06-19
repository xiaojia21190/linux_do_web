// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_view_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WebViewState _$WebViewStateFromJson(Map<String, dynamic> json) =>
    _WebViewState(
      currentUrl: json['currentUrl'] as String?,
      title: json['title'] as String?,
      error: json['error'] as String?,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      isLoading: json['isLoading'] as bool? ?? false,
      canGoBack: json['canGoBack'] as bool? ?? false,
      canGoForward: json['canGoForward'] as bool? ?? false,
    );

Map<String, dynamic> _$WebViewStateToJson(_WebViewState instance) =>
    <String, dynamic>{
      'currentUrl': instance.currentUrl,
      'title': instance.title,
      'error': instance.error,
      'progress': instance.progress,
      'isLoading': instance.isLoading,
      'canGoBack': instance.canGoBack,
      'canGoForward': instance.canGoForward,
    };
