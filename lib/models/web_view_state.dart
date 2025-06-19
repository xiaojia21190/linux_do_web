import 'package:freezed_annotation/freezed_annotation.dart';
part 'web_view_state.freezed.dart';
part 'web_view_state.g.dart';

@freezed
abstract class WebViewState with _$WebViewState {
  const factory WebViewState({String? currentUrl, String? title, String? error, @Default(0) int progress, @Default(false) bool isLoading, @Default(false) bool canGoBack, @Default(false) bool canGoForward}) = _WebViewState;

  factory WebViewState.fromJson(Map<String, Object?> json) => _$WebViewStateFromJson(json);
}
