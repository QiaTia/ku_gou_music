import 'package:flutter/material.dart';

/// 设置项的可用平台（对应 Vue 版 settings.js 中的 available 字段）
enum SettingAvailability { all, client, win32, darwin, web }

/// 设置项交互类型
enum SettingItemType {
  /// 卡片上直接渲染开关（选项恰为 on/off）
  toggle,

  /// 点击卡片打开选项弹窗
  select,

  /// 点击卡片直接执行动作
  action,

  /// 字体选择（弹窗内含搜索框与字体列表）
  font,

  /// 音频输出设备（弹窗内动态枚举设备）
  audioOutput,
}

/// 单个可选项
class SettingOption {
  final String displayText;
  final String value;
  const SettingOption(this.displayText, this.value);
}

/// 单个设置项
class SettingItem {
  final String key;
  final String label;
  final IconData icon;
  final SettingItemType type;
  final List<SettingOption> options;
  final String? defaultValue;
  final String? defaultDisplayText;

  /// 值区文字前的 emoji 前缀（对齐 Vue 版 item.icon）
  final String emoji;
  final String? selectionTitle;

  /// 选择后保持弹窗打开（用于联动展示扩展内容）
  final bool keepOpen;
  final bool showRefreshHint;
  final String refreshHintText;
  final String? helpLink;

  /// action / 特殊项的值区固定文字（如「重新查看」「操作」）
  final String? customText;
  final SettingAvailability availability;

  const SettingItem({
    required this.key,
    required this.label,
    required this.icon,
    this.type = SettingItemType.select,
    this.options = const [],
    this.defaultValue,
    this.defaultDisplayText,
    this.emoji = '',
    this.selectionTitle,
    this.keepOpen = false,
    this.showRefreshHint = false,
    this.refreshHintText = '',
    this.helpLink,
    this.customText,
    this.availability = SettingAvailability.all,
  });
}

/// 设置分组
class SettingSection {
  final String title;
  final IconData icon;
  final List<SettingItem> items;
  const SettingSection({
    required this.title,
    required this.icon,
    required this.items,
  });
}

/// 快捷键配置
class ShortcutConfig {
  final String label;
  final String defaultValue;
  const ShortcutConfig(this.label, this.defaultValue);
}

const _on = SettingOption('打开', 'on');
const _off = SettingOption('关闭', 'off');

/// 构建设置分组（对齐 MoeKoe Settings.vue 的内容）
List<SettingSection> buildSettingSections() => [
      SettingSection(
        title: '界面',
        icon: Icons.palette_outlined,
        items: [
          SettingItem(
            key: 'language',
            label: '语言',
            icon: Icons.language,
            defaultValue: '',
            defaultDisplayText: '🌏 自动',
            selectionTitle: '选择语言',
            options: [
              SettingOption('🇨🇳 简体中文', 'zh-CN'),
              SettingOption('🇨🇳 繁體中文', 'zh-TW'),
              SettingOption('🇺🇸 English', 'en'),
              SettingOption('🇷🇺 Русский', 'ru'),
              SettingOption('🇯🇵 日本語', 'ja'),
              SettingOption('🇰🇷 한국어', 'ko'),
            ],
          ),
          SettingItem(
            key: 'themeColor',
            label: '主色调',
            icon: Icons.brush_outlined,
            defaultValue: 'pink',
            selectionTitle: '选择主色调',
            emoji: '🎨 ',
            options: [
              SettingOption('少女粉', 'pink'),
              SettingOption('男男蓝', 'blue'),
              SettingOption('头顶绿', 'green'),
              SettingOption('蜜柑橙', 'orange'),
            ],
          ),
          SettingItem(
            key: 'theme',
            label: '外观',
            icon: Icons.dark_mode_outlined,
            defaultValue: 'light',
            selectionTitle: '选择外观',
            options: [
              SettingOption('🌗 自动', 'auto'),
              SettingOption('☀️ 浅色', 'light'),
              SettingOption('🌙 深色', 'dark'),
            ],
          ),
          SettingItem(
            key: 'searchMode',
            label: '搜索模式',
            icon: Icons.search,
            defaultValue: 'quick',
            selectionTitle: '搜索模式',
            options: [
              SettingOption('快速搜索', 'quick'),
              SettingOption('推荐搜索', 'recommend'),
            ],
          ),
          SettingItem(
            key: 'navigationMode',
            label: '导航方式',
            icon: Icons.menu,
            defaultValue: 'top',
            selectionTitle: '导航方式',
            options: [
              SettingOption('顶部', 'top'),
              SettingOption('左侧', 'side'),
            ],
          ),
          SettingItem(
            key: 'playerBarLayout',
            label: '播放栏布局',
            icon: Icons.web_asset_outlined,
            defaultValue: 'full',
            selectionTitle: '播放栏布局',
            options: [
              SettingOption('底部通栏', 'full'),
              SettingOption('右侧对齐', 'content'),
            ],
          ),
          SettingItem(
            key: 'nativeTitleBar',
            label: '原生标题栏',
            icon: Icons.desktop_windows_outlined,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '原生标题栏',
            options: [_on, _off],
            availability: SettingAvailability.win32,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
          SettingItem(
            key: 'font',
            label: '字体设置',
            icon: Icons.font_download_outlined,
            type: SettingItemType.font,
            defaultValue: '',
            defaultDisplayText: '默认字体',
            selectionTitle: '字体设置',
            keepOpen: true,
            helpLink: 'https://music.moekoe.cn/guide/font-settings.html',
          ),
          SettingItem(
            key: 'startupPage',
            label: '启动页',
            icon: Icons.home_outlined,
            defaultValue: 'Index',
            selectionTitle: '启动页',
            options: [
              SettingOption('首页', 'Index'),
              SettingOption('发现', 'Discover'),
              SettingOption('音乐库', 'Library'),
            ],
          ),
          SettingItem(
            key: 'onboardingGuide',
            label: '新手引导',
            icon: Icons.map_outlined,
            type: SettingItemType.action,
            customText: '重新查看',
          ),
          SettingItem(
            key: 'customTrayMenu',
            label: '托盘菜单',
            icon: Icons.window_outlined,
            defaultValue: 'native',
            selectionTitle: '托盘菜单',
            options: [
              SettingOption('原生', 'native'),
              SettingOption('高级', 'custom'),
            ],
            availability: SettingAvailability.client,
          ),
        ],
      ),
      SettingSection(
        title: '声音',
        icon: Icons.volume_up_outlined,
        items: [
          SettingItem(
            key: 'quality',
            label: '音质选择',
            icon: Icons.headphones_outlined,
            defaultValue: '128',
            selectionTitle: '音质选择',
            emoji: '🎧 ',
            options: [
              SettingOption('标准音质 - 128Kbps', '128'),
              SettingOption('高品音质 - 320Kbps', '320'),
              SettingOption('FLAC 无损', 'flac'),
              SettingOption('Hi-Res 无损', 'high'),
              SettingOption('蝰蛇全景', 'viper_atmos'),
              SettingOption('蝰蛇超清', 'viper_clear'),
              SettingOption('蝰蛇母带', 'viper_tape'),
            ],
          ),
          SettingItem(
            key: 'loudnessNormalization',
            label: '平衡音频响度',
            icon: Icons.tune,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '平衡音频响度(实验性)',
            emoji: '🎚️ ',
            options: [_on, _off],
          ),
          SettingItem(
            key: 'pauseOnAudioOutputChange',
            label: '输出设备变化自动暂停',
            icon: Icons.swap_horiz,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '输出设备变化自动暂停(实验性)',
            emoji: '🎧 ',
            options: [_on, _off],
            helpLink:
                'https://music.moekoe.cn/guide/auto-pause-on-output-device-change.html',
          ),
          SettingItem(
            key: 'audioOutputDevice',
            label: '音频输出设备',
            icon: Icons.speaker_outlined,
            type: SettingItemType.audioOutput,
            defaultValue: 'default',
            defaultDisplayText: '默认',
            selectionTitle: '音频输出设备(实验性)',
            emoji: '🔊 ',
            helpLink: 'https://music.moekoe.cn/guide/audio-output-device.html',
          ),
          SettingItem(
            key: 'greetings',
            label: '启动问候语',
            icon: Icons.chat_bubble_outline,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '启动问候语',
            emoji: '👋 ',
            options: [
              SettingOption('开启', 'on'),
              SettingOption('关闭', 'off'),
            ],
          ),
          SettingItem(
            key: 'dataSource',
            label: '数据源',
            icon: Icons.electrical_services_outlined,
            defaultValue: 'concept',
            selectionTitle: '数据源',
            emoji: '🔌 ',
            options: [
              SettingOption('概念版', 'concept'),
              SettingOption('正式版', 'official'),
            ],
            availability: SettingAvailability.client,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
            helpLink: 'https://music.moekoe.cn/guide/data-source.html',
          ),
        ],
      ),
      SettingSection(
        title: '歌词',
        icon: Icons.music_note_outlined,
        items: [
          SettingItem(
            key: 'desktopLyrics',
            label: '显示桌面歌词',
            icon: Icons.desktop_windows_outlined,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '显示桌面歌词',
            options: [_on, _off],
            availability: SettingAvailability.client,
          ),
          SettingItem(
            key: 'desktopLyricsFont',
            label: '歌词字体设置',
            icon: Icons.font_download_outlined,
            type: SettingItemType.font,
            defaultValue: '',
            defaultDisplayText: '默认字体',
            selectionTitle: '歌词字体设置',
            keepOpen: true,
            helpLink: 'https://music.moekoe.cn/guide/font-settings.html',
          ),
          SettingItem(
            key: 'statusBarLyrics',
            label: '状态栏歌词',
            icon: Icons.view_headline,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '状态栏歌词',
            options: [
              SettingOption('打开(仅支持Mac)', 'on'),
              _off,
            ],
            availability: SettingAvailability.darwin,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
          SettingItem(
            key: 'miniPlayer',
            label: '小屏播放器',
            icon: Icons.picture_in_picture_alt_outlined,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '小屏播放器（随启动打开）',
            options: [_on, _off],
            availability: SettingAvailability.client,
          ),
          SettingItem(
            key: 'lyricsTranslation',
            label: '歌词翻译',
            icon: Icons.translate,
            type: SettingItemType.toggle,
            defaultValue: 'on',
            selectionTitle: '歌词翻译',
            options: [_on, _off],
            showRefreshHint: true,
            refreshHintText: '刷新后生效',
          ),
        ],
      ),
      SettingSection(
        title: '系统',
        icon: Icons.settings_outlined,
        items: [
          SettingItem(
            key: 'gpuAcceleration',
            label: '禁用GPU加速(重启生效)',
            icon: Icons.memory,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '禁用GPU加速(重启生效)',
            options: [_on, _off],
            availability: SettingAvailability.client,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
          SettingItem(
            key: 'highDpi',
            label: '适配高DPI',
            icon: Icons.aspect_ratio,
            defaultValue: 'off',
            selectionTitle: '适配高DPI',
            options: [_on, _off],
            availability: SettingAvailability.client,
            keepOpen: true,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
          SettingItem(
            key: 'minimizeToTray',
            label: '关闭时最小化到托盘',
            icon: Icons.minimize,
            type: SettingItemType.toggle,
            defaultValue: 'on',
            selectionTitle: '关闭时最小化到托盘',
            options: [_on, _off],
            availability: SettingAvailability.client,
          ),
          SettingItem(
            key: 'autoStart',
            label: '开机自启动',
            icon: Icons.power_settings_new,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '开机自启动',
            options: [_on, _off],
            availability: SettingAvailability.client,
          ),
          SettingItem(
            key: 'networkMode',
            label: '网络模式',
            icon: Icons.hub_outlined,
            defaultValue: 'mainnet',
            selectionTitle: '网络节点',
            options: [
              SettingOption('主网', 'mainnet'),
              SettingOption('测网', 'testnet'),
              SettingOption('开发网', 'devnet'),
            ],
            availability: SettingAvailability.client,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
            helpLink: 'https://music.moekoe.cn/guide/network-modes.html',
          ),
          SettingItem(
            key: 'startMinimized',
            label: '启动时最小化',
            icon: Icons.fullscreen_exit,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '启动时最小化',
            options: [_on, _off],
          ),
          SettingItem(
            key: 'preventAppSuspension',
            label: '阻止系统休眠',
            icon: Icons.schedule,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '阻止系统休眠',
            options: [_on, _off],
            availability: SettingAvailability.client,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
          SettingItem(
            key: 'apiMode',
            label: 'API模式',
            icon: Icons.code,
            defaultValue: 'off',
            selectionTitle: 'API模式',
            options: [_on, _off],
            availability: SettingAvailability.client,
            keepOpen: true,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
          SettingItem(
            key: 'apiBaseUrlMode',
            label: 'RPC地址',
            icon: Icons.link,
            defaultValue: 'default',
            selectionTitle: 'RPC地址',
            options: [
              SettingOption('默认', 'default'),
              SettingOption('自定义', 'custom'),
            ],
            availability: SettingAvailability.client,
            keepOpen: true,
            showRefreshHint: true,
            refreshHintText: '刷新后生效',
            helpLink: 'https://music.moekoe.cn/guide/rpc-api-base-url.html',
          ),
          SettingItem(
            key: 'touchBar',
            label: 'TouchBar',
            icon: Icons.tablet_mac_outlined,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: 'TouchBar',
            options: [_on, _off],
            availability: SettingAvailability.darwin,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
          SettingItem(
            key: 'shortcuts',
            label: '全局快捷键',
            icon: Icons.keyboard_outlined,
            type: SettingItemType.action,
            customText: '自定义快捷键',
            availability: SettingAvailability.client,
          ),
          SettingItem(
            key: 'pwa',
            label: 'PWA应用',
            icon: Icons.install_mobile_outlined,
            type: SettingItemType.action,
            customText: '安装',
            availability: SettingAvailability.web,
          ),
          SettingItem(
            key: 'proxy',
            label: '网络代理',
            icon: Icons.shuffle,
            defaultValue: 'off',
            selectionTitle: '网络代理',
            options: [
              SettingOption('启用', 'on'),
              SettingOption('禁用', 'off'),
            ],
            availability: SettingAvailability.client,
            keepOpen: true,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
            helpLink: 'https://music.moekoe.cn/guide/proxy-settings.html',
          ),
          SettingItem(
            key: 'log',
            label: '日志',
            icon: Icons.description_outlined,
            defaultValue: '',
            selectionTitle: '日志',
            customText: '操作',
            options: [
              SettingOption('打开目录', 'open-path'),
              SettingOption('导出日志', 'export-log'),
            ],
            availability: SettingAvailability.client,
          ),
          SettingItem(
            key: 'backgroundThrottling',
            label: '禁用后台节流',
            icon: Icons.flash_on,
            type: SettingItemType.toggle,
            defaultValue: 'off',
            selectionTitle: '禁用后台节流',
            options: [_on, _off],
            availability: SettingAvailability.client,
            showRefreshHint: true,
            refreshHintText: '重启后生效',
          ),
        ],
      ),
    ];

/// 全局快捷键配置（对齐 Vue 版 createShortcutConfigs）
Map<String, ShortcutConfig> buildShortcutConfigs() => {
      'mainWindow': ShortcutConfig('显示/隐藏主窗口', 'Ctrl+Shift+S'),
      'quitApp': ShortcutConfig('退出主程序', 'Ctrl+Q'),
      'prevTrack': ShortcutConfig('上一首', 'Alt+Ctrl+Left'),
      'nextTrack': ShortcutConfig('下一首', 'Alt+Ctrl+Right'),
      'playPause': ShortcutConfig('暂停播放', 'Alt+Ctrl+Space'),
      'volumeUp': ShortcutConfig('音量增加', 'Alt+Ctrl+Up'),
      'volumeDown': ShortcutConfig('音量减小', 'Alt+Ctrl+Down'),
      'mute': ShortcutConfig('静音', 'Alt+Ctrl+M'),
      'like': ShortcutConfig('添加我喜欢', 'Alt+Ctrl+L'),
      'mode': ShortcutConfig('切换播放模式', 'Alt+Ctrl+P'),
      'toggleDesktopLyrics': ShortcutConfig('显示/隐藏桌面歌词', 'Alt+Ctrl+D'),
    };
