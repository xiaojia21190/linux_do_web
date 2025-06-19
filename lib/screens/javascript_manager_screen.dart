import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linux_do_web/models/java_script_injection.dart';
import '../providers/javascript_provider.dart';
import '../providers/webview_provider.dart';

class JavaScriptManagerScreen extends HookConsumerWidget {
  const JavaScriptManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scripts = ref.watch(javaScriptManagerProvider);
    final jsManager = ref.read(javaScriptManagerProvider.notifier);
    final webViewNotifier = ref.read(webViewNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('JavaScript 管理'), backgroundColor: Theme.of(context).colorScheme.inversePrimary, actions: [IconButton(icon: const Icon(Icons.add), onPressed: () => _showAddScriptDialog(context, jsManager), tooltip: '添加脚本')]),
      body: ListView.builder(
        itemCount: scripts.length,
        itemBuilder: (context, index) {
          final script = scripts[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: Switch(
                value: script.enabled,
                onChanged: (value) {
                  jsManager.toggleScript(script.name);
                },
              ),
              title: Text(script.name, style: TextStyle(fontWeight: FontWeight.bold, color: script.enabled ? null : Colors.grey)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [if (script.description.isNotEmpty) Text(script.description), const SizedBox(height: 4), Chip(label: Text(_getInjectionTimeText(script.injectionTime), style: const TextStyle(fontSize: 12)), materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('JavaScript 代码:', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey[300]!)),
                        child: Text(script.script, style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(onPressed: script.enabled ? () => webViewNotifier.injectJavaScript(script.script) : null, icon: const Icon(Icons.play_arrow), label: const Text('立即执行')),
                          ElevatedButton.icon(onPressed: () => _showEditScriptDialog(context, jsManager, script), icon: const Icon(Icons.edit), label: const Text('编辑')),
                          ElevatedButton.icon(onPressed: () => _showDeleteConfirmDialog(context, jsManager, script.name), icon: const Icon(Icons.delete), label: const Text('删除'), style: ElevatedButton.styleFrom(foregroundColor: Colors.red)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _showQuickScriptDialog(context, webViewNotifier), tooltip: '快速执行脚本', child: const Icon(Icons.flash_on)),
    );
  }

  String _getInjectionTimeText(JavaScriptInjectionTime time) {
    switch (time) {
      case JavaScriptInjectionTime.onPageStarted:
        return '页面开始加载';
      case JavaScriptInjectionTime.onPageFinished:
        return '页面加载完成';
      case JavaScriptInjectionTime.onDomContentLoaded:
        return 'DOM 内容加载完成';
    }
  }

  void _showAddScriptDialog(BuildContext context, JavaScriptManager jsManager) {
    _showScriptDialog(context, jsManager, null);
  }

  void _showEditScriptDialog(BuildContext context, JavaScriptManager jsManager, JavaScriptInjection script) {
    _showScriptDialog(context, jsManager, script);
  }

  void _showScriptDialog(BuildContext context, JavaScriptManager jsManager, JavaScriptInjection? existingScript) {
    final nameController = TextEditingController(text: existingScript?.name ?? '');
    final descriptionController = TextEditingController(text: existingScript?.description ?? '');
    final scriptController = TextEditingController(text: existingScript?.script ?? '');
    JavaScriptInjectionTime selectedTime = existingScript?.injectionTime ?? JavaScriptInjectionTime.onPageFinished;
    bool enabled = existingScript?.enabled ?? true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(existingScript == null ? '添加脚本' : '编辑脚本'),
              content: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(controller: nameController, decoration: const InputDecoration(labelText: '脚本名称', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: descriptionController, decoration: const InputDecoration(labelText: '描述', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<JavaScriptInjectionTime>(
                        value: selectedTime,
                        decoration: const InputDecoration(labelText: '注入时机', border: OutlineInputBorder()),
                        items:
                            JavaScriptInjectionTime.values.map((time) {
                              return DropdownMenuItem(value: time, child: Text(_getInjectionTimeText(time)));
                            }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedTime = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('启用脚本'),
                        value: enabled,
                        onChanged: (value) {
                          setState(() {
                            enabled = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(controller: scriptController, decoration: const InputDecoration(labelText: 'JavaScript 代码', border: OutlineInputBorder()), maxLines: 10, style: const TextStyle(fontFamily: 'monospace')),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('取消')),
                TextButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    final description = descriptionController.text.trim();
                    final script = scriptController.text.trim();

                    if (name.isNotEmpty && script.isNotEmpty) {
                      final injection = JavaScriptInjection(name: name, description: description, script: script, injectionTime: selectedTime, enabled: enabled);

                      if (existingScript == null) {
                        jsManager.addScript(injection);
                      } else {
                        jsManager.updateScript(existingScript.name, injection);
                      }

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(existingScript == null ? '添加' : '保存'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDeleteConfirmDialog(BuildContext context, JavaScriptManager jsManager, String scriptName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('确认删除'),
          content: Text('确定要删除脚本 "$scriptName" 吗？'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('取消')),
            TextButton(
              onPressed: () {
                jsManager.removeScript(scriptName);
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('删除'),
            ),
          ],
        );
      },
    );
  }

  void _showQuickScriptDialog(BuildContext context, WebViewNotifier webViewNotifier) {
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
                  webViewNotifier.injectJavaScript(script);
                  Navigator.of(context).pop();
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
