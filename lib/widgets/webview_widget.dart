import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linux_do_web/models/java_script_injection.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../providers/webview_provider.dart';
import '../providers/javascript_provider.dart';

class CustomWebViewWidget extends HookConsumerWidget {
  const CustomWebViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webViewState = ref.watch(webViewNotifierProvider);
    final webViewNotifier = ref.read(webViewNotifierProvider.notifier);
    final websiteConfig = ref.watch(websiteConfigProvider);
    final jsManager = ref.read(javaScriptManagerProvider.notifier);

    final controller = useMemoized(() {
      final ctrl = WebViewController();

      ctrl
        ..setJavaScriptMode(websiteConfig.enableJavaScript ? JavaScriptMode.unrestricted : JavaScriptMode.disabled)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              webViewNotifier.updateProgress(progress);
            },
            onPageStarted: (String url) {
              webViewNotifier.updateUrl(url);
              webViewNotifier.updateLoadingState(true);
              webViewNotifier.clearError();

              // 注入页面开始时的脚本
              final startScripts = jsManager.getScriptsByInjectionTime(JavaScriptInjectionTime.onPageStarted);
              webViewNotifier.injectScripts(startScripts);
            },
            onPageFinished: (String url) async {
              webViewNotifier.updateLoadingState(false);

              // 更新导航状态
              final canGoBack = await ctrl.canGoBack();
              final canGoForward = await ctrl.canGoForward();
              webViewNotifier.updateNavigationState(canGoBack, canGoForward);

              // 获取页面标题
              final title = await ctrl.getTitle();
              if (title != null) {
                webViewNotifier.updateTitle(title);
              }

              // 注入页面完成时的脚本
              final finishedScripts = jsManager.getScriptsByInjectionTime(JavaScriptInjectionTime.onPageFinished);
              webViewNotifier.injectScripts(finishedScripts);

              // 注入 DOM 内容加载完成时的脚本
              final domScripts = jsManager.getScriptsByInjectionTime(JavaScriptInjectionTime.onDomContentLoaded);
              if (domScripts.isNotEmpty) {
                // 等待 DOM 内容加载完成
                await Future.delayed(const Duration(milliseconds: 500));
                webViewNotifier.injectScripts(domScripts);
              }
            },
            onWebResourceError: (WebResourceError error) {
              webViewNotifier.setError(error.description);
              webViewNotifier.updateLoadingState(false);
            },
            onNavigationRequest: (NavigationRequest request) {
              // 可以在这里添加 URL 过滤逻辑
              return NavigationDecision.navigate;
            },
          ),
        );

      // 设置用户代理
      if (websiteConfig.userAgent.isNotEmpty) {
        ctrl.setUserAgent(websiteConfig.userAgent);
      }

      // 启用调试模式（如果支持）
      if (websiteConfig.debuggingEnabled) {
        // WebViewController.enableDebugging(true); // 静态方法调用
      }

      return ctrl;
    }, []);

    useEffect(() {
      webViewNotifier.setController(controller);
      controller.loadRequest(Uri.parse(websiteConfig.url));
      return null;
    }, [controller]);

    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (webViewState.isLoading) Positioned(top: 0, left: 0, right: 0, child: LinearProgressIndicator(value: webViewState.progress / 100, backgroundColor: Colors.grey[300], valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
        if (webViewState.error != null)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('加载失败', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text(webViewState.error!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: () => webViewNotifier.reload(), child: const Text('重试')),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
