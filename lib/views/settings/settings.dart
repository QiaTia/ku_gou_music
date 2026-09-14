import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/settings_controller.dart';
import 'package:ku_gou_music/models/settings/settings_model.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'package:path_provider/path_provider.dart';

/// 设置页面（对齐 MoeKoe Settings.vue 的布局与内容）
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsController _settings = Get.find<SettingsController>();
  int _activeTab = 0;

  static const _borderLight = Color(0xFFEAEAEA);
  static const _textMuted = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    final sections = _settings.sections;
    return Scaffold(
      appBar: TitleBar(title: '设置', actions: const []),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 30,
              ),
            ],
          ),
          child: Row(
            children: [
              _buildSidebar(sections),
              Expanded(child: _buildContent(sections)),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== 左侧分组栏 ====================

  Widget _buildSidebar(List<SettingSection> sections) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      width: 220,
      decoration: const BoxDecoration(
        border: Border(right: BorderSide(color: _borderLight, width: 0.5)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          final active = _activeTab == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Material(
              color: active
                  ? primary.withValues(alpha: 0.12)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                hoverColor: primary.withValues(alpha: 0.06),
                onTap: () => setState(() => _activeTab = index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Icon(
                          section.icon,
                          size: 16,
                          color: active ? primary : _textMuted,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        section.title,
                        style: TextStyle(
                          fontSize: 14,
                          color: active ? primary : null,
                          fontWeight:
                              active ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ==================== 右侧内容区 ====================

  Widget _buildContent(List<SettingSection> sections) {
    final section = sections[_activeTab];
    final visibleItems = section.items
        .where((item) => _settings.isItemVisible(item))
        .toList();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ListView(
        key: ValueKey(_activeTab),
        padding: const EdgeInsets.all(20),
        children: [
          // 分组标题
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: _borderLight)),
            ),
            child: Text(
              section.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          // 设置卡片网格
          LayoutBuilder(
            builder: (context, constraints) {
              const gap = 16.0;
              final columns = (constraints.maxWidth / 256).floor().clamp(1, 8);
              final cardWidth =
                  (constraints.maxWidth - gap * (columns - 1)) / columns;
              return Obx(
                // 显式注册集合依赖：任何设置值/提示变化都会重建卡片网格
                () {
                  _settings.values.length;
                  _settings.refreshHints.length;
                  return Wrap(
                  spacing: gap,
                  runSpacing: gap,
                  children: visibleItems
                      .map((item) => SizedBox(
                            width: cardWidth,
                            child: _SettingCard(
                              item: item,
                              settings: _settings,
                              onOpenSelection: () => _openSelection(item),
                              onAction: () => _runAction(item),
                            ),
                          ))
                      .toList(),
                );
                },
              );
            },
          ),
          const SizedBox(height: 30),
          // 恢复出厂设置
          Center(
            child: ElevatedButton.icon(
              onPressed: _openResetConfirmation,
              icon: const Icon(Icons.sync_alt, size: 16),
              label: const Text('恢复出厂设置'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF44336),
                foregroundColor: Colors.white,
                elevation: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // 版本信息
          Center(
            child: Column(
              children: [
                const Text(
                  '© KuGou Music',
                  style: TextStyle(fontSize: 14, color: _textMuted),
                ),
                Text(
                  'V1.0.0 - ${_platformName()}',
                  style: const TextStyle(fontSize: 14, color: _textMuted),
                ),
              ],
            ),
          ),
          // 底部播放器遮挡留白
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  String _platformName() {
    if (Platform.isWindows) return 'Windows';
    if (Platform.isMacOS) return 'macOS';
    if (Platform.isLinux) return 'Linux';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    return 'Unknown';
  }

  // ==================== 交互入口 ====================

  void _openSelection(SettingItem item) {
    Get.dialog(_SelectionDialog(item: item, settings: _settings));
  }

  void _runAction(SettingItem item) {
    switch (item.key) {
      case 'shortcuts':
        Get.dialog(_ShortcutDialog(settings: _settings));
        break;
      case 'onboardingGuide':
        Get.snackbar('提示', '新手引导即将上线');
        break;
      case 'pwa':
        Get.snackbar('提示', '请在 Web 环境下安装');
        break;
      default:
        break;
    }
  }

  Future<void> _runLogAction(String action) async {
    if (action == 'open-path') {
      try {
        final dir = await getApplicationSupportDirectory();
        if (Platform.isWindows) {
          await Process.start('explorer', [dir.path]);
        } else if (Platform.isMacOS) {
          await Process.start('open', [dir.path]);
        } else if (Platform.isLinux) {
          await Process.start('xdg-open', [dir.path]);
        }
      } catch (e) {
        Get.snackbar('提示', '打开目录失败: $e');
      }
    } else if (action == 'export-log') {
      Get.snackbar('提示', '当前无运行日志可导出');
    }
  }

  void _openResetConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text('提示'),
        content: const Text('你确认要恢复出厂设置吗？此操作会清空所有本地设置。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await _settings.resetAll();
              Get.snackbar('提示', '恢复出厂设置成功');
            },
            child: const Text('确定', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// ==================== 设置卡片 ====================

class _SettingCard extends StatefulWidget {
  final SettingItem item;
  final SettingsController settings;
  final VoidCallback onOpenSelection;
  final VoidCallback onAction;

  const _SettingCard({
    required this.item,
    required this.settings,
    required this.onOpenSelection,
    required this.onAction,
  });

  @override
  State<_SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<_SettingCard> {
  bool _hovered = false;

  static const _borderLight = Color(0xFFEAEAEA);

  bool get _isToggle => widget.item.type == SettingItemType.toggle;

  void _handleTap() {
    final item = widget.item;
    if (item.type == SettingItemType.action) {
      widget.onAction();
      return;
    }
    if (_isToggle) return; // 开关项由开关控件处理
    widget.onOpenSelection();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final primary = Theme.of(context).colorScheme.primary;
    final showHint = widget.settings.refreshHints.contains(item.key);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _hovered
              ? (Matrix4.identity()..setTranslationRaw(0, -2, 0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _hovered ? 0.18 : 0.15),
                blurRadius: _hovered ? 24 : 16,
                offset: Offset(0, _hovered ? 8 : 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 头部：图标 + 标题 + 刷新提示 + 帮助按钮
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(item.icon, size: 16, color: primary),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      item.label,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  if (item.showRefreshHint && showHint)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        item.refreshHintText,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFF4D4F),
                        ),
                      ),
                    ),
                  if (item.helpLink != null)
                    GestureDetector(
                      onTap: () => _openHelpLink(item.helpLink!),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(
                          Icons.help_outline,
                          size: 18,
                          color: primary,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              // 值区
              _isToggle ? _buildToggleValue() : _buildSelectValue(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleValue() {
    final item = widget.item;
    final enabled = widget.settings.values[item.key] == 'on';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            '${item.emoji}${enabled ? '开启' : '关闭'}',
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 12),
        _SettingSwitch(
          value: enabled,
          onChanged: () => widget.settings.toggle(item),
        ),
      ],
    );
  }

  Widget _buildSelectValue() {
    final item = widget.item;
    final text =
        '${item.emoji}${widget.settings.displayTextOf(item)}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: _borderLight),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const Icon(Icons.chevron_right, size: 14, color: Color(0xFF999999)),
        ],
      ),
    );
  }

  void _openHelpLink(String url) {
    try {
      if (Platform.isWindows) {
        Process.start('explorer', [url]);
      } else if (Platform.isMacOS) {
        Process.start('open', [url]);
      } else if (Platform.isLinux) {
        Process.start('xdg-open', [url]);
      }
    } catch (_) {
      Get.snackbar('帮助链接', url);
    }
  }
}

/// 自定义开关（对齐 Vue 版 40x22 圆角滑块）
class _SettingSwitch extends StatelessWidget {
  final bool value;
  final VoidCallback onChanged;

  const _SettingSwitch({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 22,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: value ? primary : const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(999),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== 选项弹窗 ====================

class _SelectionDialog extends StatefulWidget {
  final SettingItem item;
  final SettingsController settings;

  const _SelectionDialog({required this.item, required this.settings});

  @override
  State<_SelectionDialog> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<_SelectionDialog> {
  String _fontSearch = '';

  // 表单状态（代理 / RPC）
  final _formController = TextEditingController();
  bool _testing = false;
  String _testResult = '';
  bool _testSuccess = false;

  // 音频输出设备模拟加载
  bool _audioLoading = false;

  // DPI 滑杆
  late double _dpiScale;

  SettingItem get item => widget.item;
  SettingsController get settings => widget.settings;

  @override
  void initState() {
    super.initState();
    _dpiScale =
        double.tryParse(settings.values['dpiScale'] ?? '1.0') ?? 1.0;
    if (item.key == 'proxy') {
      _formController.text = settings.values['proxyUrl'] ?? '';
    }
    if (item.key == 'apiBaseUrlMode') {
      _formController.text = settings.values['apiBaseUrl'] ?? '';
    }
    if (item.type == SettingItemType.audioOutput) {
      _audioLoading = true;
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) setState(() => _audioLoading = false);
      });
    }
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  void _selectOption(SettingOption option) {
    // 日志项：直接执行动作，不保存
    if (item.key == 'log') {
      Navigator.of(context).pop();
      final pageState =
          context.findAncestorStateOfType<_SettingsPageState>();
      pageState?._runLogAction(option.value);
      return;
    }
    settings.setValue(item.key, option.value);
    if (!item.keepOpen) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Dialog(
      // 原版弹窗为纯白底（M3 默认会用主色染 surfaceContainerHigh，导致整块偏色）
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.surface
          : Colors.white,
      // 防御性关闭 M3 色调叠加（当前 Flutter 默认已透明）
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400,
          maxHeight: mediaHeight * 0.62,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.selectionTitle ?? item.label,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  // 字体搜索框
                  if (item.type == SettingItemType.font)
                    TextField(
                      decoration: InputDecoration(
                        hintText: '搜索字体...',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                      onChanged: (v) => setState(() => _fontSearch = v),
                    ),
                  // 选项列表 / 特殊内容（显式注册依赖，值变化时重建弹窗内容）
                  Flexible(
                    child: Obx(() {
                      settings.values.length;
                      return _buildBody();
                    }),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(96, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('关闭', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
            // 帮助链接
            if (item.helpLink != null)
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () {
                    try {
                      if (Platform.isWindows) {
                        Process.start('explorer', [item.helpLink!]);
                      } else if (Platform.isMacOS) {
                        Process.start('open', [item.helpLink!]);
                      } else if (Platform.isLinux) {
                        Process.start('xdg-open', [item.helpLink!]);
                      }
                    } catch (_) {
                      Get.snackbar('帮助链接', item.helpLink!);
                    }
                  },
                  child: Icon(Icons.help_outline, size: 18, color: primary),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (item.key) {
      case 'highDpi':
        return _buildOptionsWithExtra(
          extra: _buildDpiSlider(),
        );
      case 'apiMode':
        return _buildOptionsWithExtra(
          extra: settings.values['apiMode'] == 'on' ? _buildApiInfo() : null,
        );
      case 'apiBaseUrlMode':
        return _buildOptionsWithExtra(
          extra: settings.values['apiBaseUrlMode'] == 'custom'
              ? _buildApiUrlForm()
              : null,
        );
      case 'proxy':
        return _buildOptionsWithExtra(
          extra:
              settings.values['proxy'] == 'on' ? _buildProxyForm() : null,
        );
      default:
        break;
    }

    if (item.type == SettingItemType.font) return _buildFontList();
    if (item.type == SettingItemType.audioOutput) return _buildAudioList();
    return _buildOptionList(item.options);
  }

  Widget _buildOptionsWithExtra({Widget? extra}) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...item.options.map(_optionTile),
        ?extra,
      ],
    );
  }

  Widget _buildOptionList(List<SettingOption> options) {
    return ListView(
      shrinkWrap: true,
      children: options.map(_optionTile).toList(),
    );
  }

  Widget _optionTile(SettingOption option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          hoverColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
          onTap: () => _selectOption(option),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(option.displayText),
          ),
        ),
      ),
    );
  }

  // ---------- 字体列表 ----------

  Widget _buildFontList() {
    final query = _fontSearch.toLowerCase();
    final fonts = SettingsController.fontOptions
        .where((o) =>
            query.isEmpty || o.displayText.toLowerCase().contains(query))
        .toList();
    if (fonts.isEmpty) {
      return const Center(child: Text('默认字体'));
    }
    return ListView(
      shrinkWrap: true,
      children: fonts.map((option) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              hoverColor: Theme.of(context)
                  .colorScheme
                  .primary
                  .withValues(alpha: 0.08),
              onTap: () {
                settings.setValue(item.key, option.value);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  option.displayText,
                  style: TextStyle(
                    fontFamily: option.value.isEmpty ? null : option.value,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ---------- 音频输出设备 ----------

  Widget _buildAudioList() {
    if (_audioLoading) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: Text('正在获取设备列表...'),
      );
    }
    return ListView(
      shrinkWrap: true,
      children: [
        _optionTile(const SettingOption('默认', 'default')),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            '未检测到其他音频输出设备',
            style: TextStyle(color: Color(0xFF999999), fontSize: 13),
          ),
        ),
      ],
    );
  }

  // ---------- 高 DPI 滑杆 ----------

  Widget _buildDpiSlider() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '缩放因子: ${_dpiScale.toStringAsFixed(1)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              const Text(
                '调整后需重启',
                style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
              ),
            ],
          ),
          Slider(
            value: _dpiScale,
            min: 0.5,
            max: 2.0,
            divisions: 15,
            onChanged: (v) {
              setState(() => _dpiScale = v);
              settings.setValue('dpiScale', v.toStringAsFixed(1));
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0.5', style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
                Text('1.0', style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
                Text('1.5', style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
                Text('2.0', style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------- API 模式信息 ----------

  Widget _buildApiInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _readonlyField('API地址', '内置接口服务'),
          _readonlyField('WebSocket地址', 'ws://127.0.0.1:6520'),
          const SizedBox(height: 5),
          const Text(
            '默认 API 提示：当前使用内置接口服务，地址仅供查看。',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }

  Widget _readonlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF333333))),
          const SizedBox(height: 5),
          TextField(
            controller: TextEditingController(text: value),
            readOnly: true,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- RPC 地址表单 ----------

  Widget _buildApiUrlForm() {
    return _buildForm(
      placeholder: 'RPC地址（留空使用默认）',
      onTest: () async {
        setState(() {
          _testing = true;
          _testResult = '正在测试...';
        });
        final (ok, msg) =
            await settings.testApiBaseUrl(_formController.text);
        if (!mounted) return;
        setState(() {
          _testing = false;
          _testResult = msg;
          _testSuccess = ok;
        });
      },
      onSave: () {
        final url = _formController.text.trim();
        if (url.isEmpty) {
          settings.setValue('apiBaseUrlMode', 'default');
          settings.setValue('apiBaseUrl', '');
        } else {
          Uri? uri;
          try {
            uri = Uri.parse(url);
          } catch (_) {}
          if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
            Get.snackbar('提示', '请输入有效的 URL');
            return;
          }
          settings.setValue('apiBaseUrlMode', 'custom');
          settings.setValue('apiBaseUrl', url);
        }
        Navigator.of(context).pop();
      },
    );
  }

  // ---------- 代理表单 ----------

  Widget _buildProxyForm() {
    return _buildForm(
      placeholder: '代理地址，如 http://127.0.0.1:7890',
      onTest: () async {
        setState(() {
          _testing = true;
          _testResult = '正在测试...';
        });
        final (ok, msg) = await settings.testProxy(_formController.text);
        if (!mounted) return;
        setState(() {
          _testing = false;
          _testResult = msg;
          _testSuccess = ok;
        });
      },
      onSave: () {
        final url = _formController.text.trim();
        if (url.isNotEmpty) {
          Uri? uri;
          try {
            uri = Uri.parse(url);
          } catch (_) {}
          if (uri == null ||
              (uri.scheme != 'http' && uri.scheme != 'https')) {
            Get.snackbar('提示', '仅支持 http/https 代理');
            return;
          }
        }
        settings.setValue('proxy', url.isEmpty ? 'off' : 'on');
        settings.setValue('proxyUrl', url);
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildForm({
    required String placeholder,
    required Future<void> Function() onTest,
    required VoidCallback onSave,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          TextField(
            controller: _formController,
            decoration: InputDecoration(
              hintText: placeholder,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _testing ? null : onTest,
                  child: Text(_testing ? '正在测试...' : '测试连接'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('保存设置'),
                ),
              ),
            ],
          ),
          if (_testResult.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                _testResult,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: _testSuccess
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFE53935),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ==================== 快捷键弹窗 ====================

class _ShortcutDialog extends StatefulWidget {
  final SettingsController settings;

  const _ShortcutDialog({required this.settings});

  @override
  State<_ShortcutDialog> createState() => _ShortcutDialogState();
}

class _ShortcutDialogState extends State<_ShortcutDialog> {
  late Map<String, String> _temp;
  String? _recordingKey;
  final FocusNode _keyFocus = FocusNode();

  static final _specialKeys = <LogicalKeyboardKey, String>{
    LogicalKeyboardKey.space: 'Space',
    LogicalKeyboardKey.arrowUp: 'Up',
    LogicalKeyboardKey.arrowDown: 'Down',
    LogicalKeyboardKey.arrowLeft: 'Left',
    LogicalKeyboardKey.arrowRight: 'Right',
    LogicalKeyboardKey.escape: 'Esc',
    LogicalKeyboardKey.backspace: 'Backspace',
    LogicalKeyboardKey.delete: 'Delete',
    LogicalKeyboardKey.enter: 'Return',
    LogicalKeyboardKey.tab: 'Tab',
    LogicalKeyboardKey.pageUp: 'PageUp',
    LogicalKeyboardKey.pageDown: 'PageDown',
    LogicalKeyboardKey.home: 'Home',
    LogicalKeyboardKey.end: 'End',
    LogicalKeyboardKey.numpad0: 'num0',
    LogicalKeyboardKey.numpad1: 'num1',
    LogicalKeyboardKey.numpad2: 'num2',
    LogicalKeyboardKey.numpad3: 'num3',
    LogicalKeyboardKey.numpad4: 'num4',
    LogicalKeyboardKey.numpad5: 'num5',
    LogicalKeyboardKey.numpad6: 'num6',
    LogicalKeyboardKey.numpad7: 'num7',
    LogicalKeyboardKey.numpad8: 'num8',
    LogicalKeyboardKey.numpad9: 'num9',
    LogicalKeyboardKey.numpadDecimal: 'numdec',
    LogicalKeyboardKey.numpadAdd: 'numadd',
    LogicalKeyboardKey.numpadSubtract: 'numsub',
    LogicalKeyboardKey.numpadMultiply: 'nummult',
    LogicalKeyboardKey.numpadDivide: 'numdiv',
  };

  SettingsController get settings => widget.settings;

  @override
  void initState() {
    super.initState();
    _temp = Map<String, String>.from(settings.shortcuts);
  }

  @override
  void dispose() {
    _keyFocus.dispose();
    super.dispose();
  }

  String _displayShortcut(String key) {
    var display = _temp[key] ?? '';
    if (display.isEmpty) return '';
    display = display.replaceAll(
      'Meta',
      Platform.isMacOS ? '⌘' : 'Win',
    );
    display = display.replaceAllMapped(
      RegExp(r'num(dec|add|sub|mult|div|\d)'),
      (m) => 'Num${m.group(1)}',
    );
    return display;
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    final recording = _recordingKey;
    if (recording == null) return KeyEventResult.ignored;
    if (event is! KeyDownEvent) return KeyEventResult.handled;

    final pressed = HardwareKeyboard.instance.logicalKeysPressed;
    final keys = <String>[];
    if (pressed.contains(LogicalKeyboardKey.metaLeft) ||
        pressed.contains(LogicalKeyboardKey.metaRight)) {
      keys.add('Meta');
    }
    if (pressed.contains(LogicalKeyboardKey.controlLeft) ||
        pressed.contains(LogicalKeyboardKey.controlRight)) {
      keys.add('Ctrl');
    }
    if (pressed.contains(LogicalKeyboardKey.altLeft) ||
        pressed.contains(LogicalKeyboardKey.altRight)) {
      keys.add('Alt');
    }
    if (pressed.contains(LogicalKeyboardKey.shiftLeft) ||
        pressed.contains(LogicalKeyboardKey.shiftRight)) {
      keys.add('Shift');
    }

    final key = event.logicalKey;
    final isModifier = {
      LogicalKeyboardKey.controlLeft,
      LogicalKeyboardKey.controlRight,
      LogicalKeyboardKey.altLeft,
      LogicalKeyboardKey.altRight,
      LogicalKeyboardKey.shiftLeft,
      LogicalKeyboardKey.shiftRight,
      LogicalKeyboardKey.metaLeft,
      LogicalKeyboardKey.metaRight,
    }.contains(key);

    if (isModifier) {
      if (keys.isNotEmpty) {
        setState(() {
          _temp[recording] = '${keys.join('+')}+请按下其他键';
        });
      }
      return KeyEventResult.handled;
    }

    final label = _specialKeys[key] ?? key.keyLabel.toUpperCase();
    if (keys.isEmpty) {
      Get.snackbar('提示', '快捷键必须包含至少一个修饰键 (Ctrl/Alt/Shift/Win)');
      return KeyEventResult.handled;
    }

    keys.add(label);
    final combo = keys.join('+');
    final conflict = _temp.entries.firstWhere(
      (e) => e.value == combo && e.key != recording,
      orElse: () => const MapEntry('', ''),
    );
    if (conflict.key.isNotEmpty) {
      final conflictLabel =
          settings.shortcutConfigs[conflict.key]?.label ?? conflict.key;
      Get.snackbar('提示', '该快捷键与「$conflictLabel」的快捷键冲突');
      return KeyEventResult.handled;
    }

    setState(() {
      _temp[recording] = combo;
      _recordingKey = null;
    });
    return KeyEventResult.handled;
  }

  void _save() {
    final invalid = _temp.entries.where(
      (e) =>
          e.value.isNotEmpty &&
          !e.value.split('+').any(
                (k) => const {'Ctrl', 'Alt', 'Shift', 'Meta'}.contains(k),
              ),
    );
    if (invalid.isNotEmpty) {
      Get.snackbar('提示', '存在无效的快捷键设置，请确保每个快捷键都包含修饰键');
      return;
    }
    settings.saveShortcuts(_temp);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Focus(
      focusNode: _keyFocus,
      onKeyEvent: _onKeyEvent,
      child: Dialog(
        // 与原版一致：纯白弹窗底
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : Colors.white,
        surfaceTintColor: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
            maxHeight: mediaHeight * 0.75,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '快捷键设置',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: settings.shortcutConfigs.entries.map((entry) {
                      final key = entry.key;
                      final config = entry.value;
                      final recording = _recordingKey == key;
                      final display = _displayShortcut(key);
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(config.label),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _recordingKey = key;
                                      _temp[key] = '请按下修饰键';
                                    });
                                    _keyFocus.requestFocus();
                                  },
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(minWidth: 150),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: recording
                                          ? primary
                                          : const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            display.isEmpty
                                                ? '点击设置快捷键'
                                                : display,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: recording
                                                  ? Colors.white
                                                  : null,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        if ((_temp[key] ?? '').isNotEmpty &&
                                            !recording)
                                          GestureDetector(
                                            onTap: () => setState(
                                                () => _temp[key] = ''),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8),
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withValues(alpha: 0.1),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.close,
                                                size: 10,
                                                color: Color(0xFF666666),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1, color: Color(0xFFEEEEEE)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('取消'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _save,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('保存'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
