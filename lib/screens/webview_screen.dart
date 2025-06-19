import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/webview_provider.dart';
import '../widgets/webview_widget.dart';
import 'javascript_manager_screen.dart';

class WebViewScreen extends HookConsumerWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webViewState = ref.watch(webViewNotifierProvider);
    final webViewNotifier = ref.read(webViewNotifierProvider.notifier);
    final websiteConfig = ref.watch(websiteConfigProvider);

    final urlController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(webViewState.title != null ? webViewState.title! : websiteConfig.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () => webViewNotifier.reload(), tooltip: '刷新'),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'copy_url':
                  if (webViewState.currentUrl != null) {
                    Clipboard.setData(ClipboardData(text: webViewState.currentUrl ?? ''));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('URL 已复制到剪贴板')));
                  }
                  break;
                case 'go_to_url':
                  _showGoToUrlDialog(context, urlController, webViewNotifier);
                  break;
                case 'javascript_manager':
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaScriptManagerScreen()));
                  break;
                case 'quick_script':
                  _showQuickScriptDialog(context, webViewNotifier);
                  break;
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  const PopupMenuItem<String>(value: 'copy_url', child: ListTile(leading: Icon(Icons.copy), title: Text('复制链接'))),
                  const PopupMenuItem<String>(value: 'go_to_url', child: ListTile(leading: Icon(Icons.open_in_browser), title: Text('跳转到URL'))),
                  const PopupMenuItem<String>(value: 'javascript_manager', child: ListTile(leading: Icon(Icons.code), title: Text('JavaScript 管理'))),
                  const PopupMenuItem<String>(value: 'quick_script', child: ListTile(leading: Icon(Icons.flash_on), title: Text('快速执行脚本'))),
                ],
          ),
        ],
        bottom: PreferredSize(preferredSize: const Size.fromHeight(4.0), child: webViewState.isLoading ? LinearProgressIndicator(value: webViewState.progress / 100, backgroundColor: Colors.grey[300]) : const SizedBox.shrink()),
      ),
      body: const CustomWebViewWidget(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: const Icon(Icons.arrow_back), onPressed: webViewState.canGoBack ? () => webViewNotifier.goBack() : null, tooltip: '后退'),
            IconButton(icon: const Icon(Icons.arrow_forward), onPressed: webViewState.canGoForward ? () => webViewNotifier.goForward() : null, tooltip: '前进'),
            IconButton(icon: const Icon(Icons.home), onPressed: () => webViewNotifier.loadUrl(websiteConfig.url), tooltip: '首页'),
            IconButton(icon: const Icon(Icons.refresh), onPressed: () => webViewNotifier.reload(), tooltip: '刷新'),
          ],
        ),
      ),
    );
  }

  void _showGoToUrlDialog(BuildContext context, TextEditingController controller, WebViewNotifier notifier) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('跳转到URL'),
          content: TextField(controller: controller, decoration: const InputDecoration(hintText: '请输入URL', border: OutlineInputBorder()), keyboardType: TextInputType.url, autofocus: true),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('取消')),
            TextButton(
              onPressed: () {
                final url = controller.text.trim();
                if (url.isNotEmpty) {
                  String finalUrl = url;
                  if (!url.startsWith('http://') && !url.startsWith('https://')) {
                    finalUrl = 'https://$url';
                  }
                  notifier.loadUrl(finalUrl);
                  Navigator.of(context).pop();
                  controller.clear();
                }
              },
              child: const Text('跳转'),
            ),
          ],
        );
      },
    );
  }

  void _showQuickScriptDialog(BuildContext context, WebViewNotifier notifier) {
    final scriptController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('快速执行脚本'),
          content: TextField(controller: scriptController, decoration: const InputDecoration(labelText: 'JavaScript 代码', border: OutlineInputBorder(), hintText: '例如: alert("Hello World!");'), maxLines: 5, style: const TextStyle(fontFamily: 'monospace'), autofocus: true),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('取消')),
            TextButton(
              onPressed: () {
                final script = scriptController.text.trim();
                if (script.isNotEmpty) {
                  notifier.injectJavaScript(script);
                  Navigator.of(context).pop();
                  scriptController.clear();
                }
              },
              child: const Text('执行'),
            ),
          ],
        );
      },
    );
  }
}
