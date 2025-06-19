# Linux.do Web App

一个使用 Flutter 开发的 WebView 应用，专门用于展示 Linux.do 社区网站内容。

## 技术栈

- **Flutter**: 跨平台移动应用开发框架
- **webview_flutter**: WebView 组件库
- **Riverpod**: 状态管理
- **Hooks**: React-style hooks for Flutter
- **Freezed**: 不可变数据类生成器
- **JSON Serializable**: JSON 序列化支持

## 功能特性

### 核心功能
- ✅ 完整的 WebView 集成
- ✅ 页面加载进度显示
- ✅ 前进/后退导航
- ✅ 页面刷新
- ✅ URL 跳转
- ✅ 错误处理和重试
- ✅ 链接复制功能

### 状态管理
- ✅ 使用 Riverpod 进行状态管理
- ✅ WebView 状态实时更新
- ✅ 导航状态管理
- ✅ 加载状态管理

### 用户界面
- ✅ Material Design 3 设计
- ✅ 响应式布局
- ✅ 加载进度条
- ✅ 底部导航栏
- ✅ 错误页面显示

## 项目结构

```
lib/
├── main.dart                 # 应用入口
├── models/                   # 数据模型
│   ├── website_config.dart   # 网站配置模型
│   ├── website_config.freezed.dart
│   └── website_config.g.dart
├── providers/                # 状态管理
│   ├── webview_provider.dart # WebView 状态管理
│   └── webview_provider.g.dart
├── screens/                  # 页面
│   └── webview_screen.dart   # 主 WebView 页面
└── widgets/                  # 自定义组件
    └── webview_widget.dart   # WebView 组件
```

## 安装和运行

### 前置要求
- Flutter SDK 3.7.0+
- Dart SDK 3.7.0+

### 安装依赖
```bash
flutter pub get
```

### 代码生成
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 运行应用
```bash
flutter run
```

## 配置

### 网站配置
在 `lib/providers/webview_provider.dart` 中的 `websiteConfigProvider` 可以配置：

- `url`: 默认加载的网站 URL
- `title`: 应用标题
- `description`: 网站描述
- `enableJavaScript`: 是否启用 JavaScript
- `enableDomStorage`: 是否启用 DOM 存储
- `debuggingEnabled`: 是否启用调试模式
- `userAgent`: 自定义用户代理

### 示例配置
```dart
return const WebsiteConfig(
  url: 'https://linux.do',
  title: 'Linux.do',
  description: 'Linux.do 社区',
  enableJavaScript: true,
  enableDomStorage: true,
  debuggingEnabled: false,
);
```

## 使用说明

### 基本操作
1. **页面导航**: 使用底部的前进/后退按钮
2. **刷新页面**: 点击刷新按钮或使用顶部菜单
3. **跳转 URL**: 通过菜单选择"跳转到URL"
4. **复制链接**: 通过菜单选择"复制链接"
5. **返回首页**: 点击底部的首页按钮

### 高级功能
- **错误重试**: 当页面加载失败时，会显示错误页面和重试按钮
- **加载进度**: 页面加载时会显示进度条
- **状态同步**: 导航按钮会根据实际状态启用/禁用

## 开发

### 添加新功能
1. 在相应的目录下创建新文件
2. 使用 Riverpod 进行状态管理
3. 使用 Hooks 简化组件逻辑
4. 使用 Freezed 创建不可变数据模型

### 代码生成
当修改了使用 `@freezed` 或 `@riverpod` 注解的文件后，需要重新运行代码生成：

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 许可证

本项目使用 MIT 许可证。
