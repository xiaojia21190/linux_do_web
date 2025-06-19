import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linux_do_web/models/java_script_injection.dart';
import 'package:linux_do_web/models/web_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/website_config.dart';

part 'webview_provider.g.dart';

@riverpod
class WebViewNotifier extends _$WebViewNotifier {
  WebViewController? _controller;

  @override
  WebViewState build() {
    return const WebViewState();
  }

  WebViewController? get controller => _controller;

  void setController(WebViewController controller) {
    _controller = controller;
  }

  void updateUrl(String url) {
    state = state.copyWith(currentUrl: url);
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateLoadingState(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void updateProgress(int progress) {
    state = state.copyWith(progress: progress);
  }

  void updateNavigationState(bool canGoBack, bool canGoForward) {
    state = state.copyWith(canGoBack: canGoBack, canGoForward: canGoForward);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> loadUrl(String url) async {
    if (_controller != null) {
      await _controller!.loadRequest(Uri.parse(url));
    }
  }

  Future<void> reload() async {
    if (_controller != null) {
      await _controller!.reload();
    }
  }

  Future<void> goBack() async {
    if (_controller != null && state.canGoBack) {
      await _controller!.goBack();
    }
  }

  Future<void> goForward() async {
    if (_controller != null && state.canGoForward) {
      await _controller!.goForward();
    }
  }

  Future<void> injectJavaScript(String script) async {
    if (_controller != null) {
      try {
        await _controller!.runJavaScript(script);
      } catch (e) {
        setError('JavaScript 注入失败: $e');
      }
    }
  }

  Future<String?> evaluateJavaScript(String script) async {
    if (_controller != null) {
      try {
        final result = await _controller!.runJavaScriptReturningResult(script);
        return result.toString();
      } catch (e) {
        setError('JavaScript 执行失败: $e');
        return null;
      }
    }
    return null;
  }

  Future<void> injectScripts(List<JavaScriptInjection> scripts) async {
    for (final script in scripts) {
      await injectJavaScript(script.script);
    }
  }
}

@riverpod
WebsiteConfig websiteConfig(Ref ref) {
  // 默认配置，可以从配置文件或远程加载
  return const WebsiteConfig(url: 'https://linux.do', title: 'Linux.do', description: 'Linux.do 社区', enableJavaScript: true, enableDomStorage: true, debuggingEnabled: false);
}
