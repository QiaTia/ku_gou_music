import 'package:flutter/widgets.dart';

/// 发现页的响应式适配约定
///
/// 该模块原本按 PC 设计，但移动端底栏同样有「发现」入口，且移动端外壳
/// （`MobileLayoutPage`）使用 `Scaffold(extendBody: true)`，悬浮 TabBar 会盖住
/// 页面底部区域，因此滚动内容需要额外预留底部避让空间。
class DiscoverLayout {
  /// 窄屏断点：小于该宽度按移动端处理（与 ranking_content 的 768 断点保持同向）
  static const double compactBreakpoint = 600;

  /// 移动端悬浮 TabBar 自身高度（MobileLayoutPage 中为 84）
  static const double mobileTabBarHeight = 84;

  /// 移动端悬浮 TabBar 高度（84）+ 底部安全区余量，供滚动内容底部避让
  static const double mobileBottomInset = 104;

  /// 桌面端常规底部留白
  static const double desktopBottomInset = 20;

  static bool isCompact(BuildContext context) =>
      MediaQuery.sizeOf(context).width < compactBreakpoint;

  /// 滚动内容的底部内边距（移动端需要避开悬浮 TabBar）
  static double bottomInset(BuildContext context) =>
      isCompact(context) ? mobileBottomInset : desktopBottomInset;

  /// 内容区四周内边距
  static EdgeInsets contentPadding(BuildContext context) => isCompact(context)
      ? const EdgeInsets.fromLTRB(12, 8, 12, 12)
      : const EdgeInsets.fromLTRB(20, 12, 20, 20);

  /// 卡片网格参数：窄屏用更小的卡片宽度与间距，并把卡片拉高一点，
  /// 避免封面 + 两行简介在窄卡片里被挤到溢出
  static double gridMaxExtent(BuildContext context) =>
      isCompact(context) ? 200 : 210;

  static double gridSpacing(BuildContext context) =>
      isCompact(context) ? 12 : 18;

  static double gridAspectRatio(BuildContext context) =>
      isCompact(context) ? 0.62 : 0.72;
}
