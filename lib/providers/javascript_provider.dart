import 'package:linux_do_web/models/java_script_injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'javascript_provider.g.dart';

@riverpod
class JavaScriptManager extends _$JavaScriptManager {
  @override
  List<JavaScriptInjection> build() {
    return [
      // 默认的 JavaScript 注入脚本
      const JavaScriptInjection(
        name: 'Dark Mode Toggle',
        description: '添加深色模式切换功能',
        script: '''
          (function() {
            // 创建深色模式切换按钮
            const darkModeButton = document.createElement('button');
            darkModeButton.innerHTML = '🌙';
            darkModeButton.style.cssText = `
              position: fixed;
              top: 20px;
              right: 20px;
              z-index: 9999;
              background: #333;
              color: white;
              border: none;
              border-radius: 50%;
              width: 50px;
              height: 50px;
              font-size: 20px;
              cursor: pointer;
              box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            `;

            darkModeButton.onclick = function() {
              document.body.style.filter =
                document.body.style.filter === 'invert(1) hue-rotate(180deg)'
                  ? ''
                  : 'invert(1) hue-rotate(180deg)';
              darkModeButton.innerHTML =
                document.body.style.filter === '' ? '🌙' : '☀️';
            };

            document.body.appendChild(darkModeButton);
          })();
        ''',
        injectionTime: JavaScriptInjectionTime.onPageFinished,
        enabled: true,
      ),

      const JavaScriptInjection(
        name: 'Remove Ads',
        description: '移除常见的广告元素',
        script: '''
          (function() {
            // 移除常见的广告选择器
            const adSelectors = [
              '.ad', '.ads', '.advertisement', '.banner',
              '[class*="ad-"]', '[id*="ad-"]', '[class*="ads-"]',
              '.google-ads', '.adsense', '.adsbygoogle'
            ];

            adSelectors.forEach(selector => {
              const elements = document.querySelectorAll(selector);
              elements.forEach(el => el.remove());
            });

            console.log('广告移除脚本已执行');
          })();
        ''',
        injectionTime: JavaScriptInjectionTime.onPageFinished,
        enabled: false,
      ),

      const JavaScriptInjection(
        name: 'Auto Scroll',
        description: '自动滚动页面',
        script: '''
          (function() {
            let isAutoScrolling = false;
            let scrollInterval;

            const autoScrollButton = document.createElement('button');
            autoScrollButton.innerHTML = '📜';
            autoScrollButton.style.cssText = `
              position: fixed;
              top: 80px;
              right: 20px;
              z-index: 9999;
              background: #007bff;
              color: white;
              border: none;
              border-radius: 50%;
              width: 50px;
              height: 50px;
              font-size: 20px;
              cursor: pointer;
              box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            `;

            autoScrollButton.onclick = function() {
              if (isAutoScrolling) {
                clearInterval(scrollInterval);
                isAutoScrolling = false;
                autoScrollButton.style.background = '#007bff';
              } else {
                scrollInterval = setInterval(() => {
                  window.scrollBy(0, 2);
                }, 50);
                isAutoScrolling = true;
                autoScrollButton.style.background = '#dc3545';
              }
            };

            document.body.appendChild(autoScrollButton);
          })();
        ''',
        injectionTime: JavaScriptInjectionTime.onPageFinished,
        enabled: false,
      ),

      const JavaScriptInjection(
        name: 'Console Logger',
        description: '页面加载信息记录',
        script: '''
          console.log('页面开始加载:', window.location.href);
          console.log('用户代理:', navigator.userAgent);
          console.log('页面标题:', document.title);
        ''',
        injectionTime: JavaScriptInjectionTime.onPageStarted,
        enabled: true,
      ),
    ];
  }

  void addScript(JavaScriptInjection script) {
    state = [...state, script];
  }

  void removeScript(String name) {
    state = state.where((script) => script.name != name).toList();
  }

  void updateScript(String name, JavaScriptInjection updatedScript) {
    state =
        state.map((script) {
          return script.name == name ? updatedScript : script;
        }).toList();
  }

  void toggleScript(String name) {
    state =
        state.map((script) {
          return script.name == name ? script.copyWith(enabled: !script.enabled) : script;
        }).toList();
  }

  List<JavaScriptInjection> getEnabledScripts() {
    return state.where((script) => script.enabled).toList();
  }

  List<JavaScriptInjection> getScriptsByInjectionTime(JavaScriptInjectionTime time) {
    return getEnabledScripts().where((script) => script.injectionTime == time).toList();
  }
}
