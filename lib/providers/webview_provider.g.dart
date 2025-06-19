// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$websiteConfigHash() => r'756bcffc06eaa74caf043306c2c6c2d144784c2c';

/// See also [websiteConfig].
@ProviderFor(websiteConfig)
final websiteConfigProvider = AutoDisposeProvider<WebsiteConfig>.internal(
  websiteConfig,
  name: r'websiteConfigProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$websiteConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WebsiteConfigRef = AutoDisposeProviderRef<WebsiteConfig>;
String _$webViewNotifierHash() => r'8b2580a41a08d48a42ffb003fb1ee29bad07eab4';

/// See also [WebViewNotifier].
@ProviderFor(WebViewNotifier)
final webViewNotifierProvider =
    AutoDisposeNotifierProvider<WebViewNotifier, WebViewState>.internal(
      WebViewNotifier.new,
      name: r'webViewNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$webViewNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WebViewNotifier = AutoDisposeNotifier<WebViewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
