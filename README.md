# 酷狗音乐客户端（ku_gou_music）

一个基于 **Flutter** 的第三方酷狗音乐客户端，支持 Android / iOS / Windows / macOS / Linux 多端运行。采用 GetX 进行状态管理与依赖注入，复用酷狗官方网关接口（`gateway.kugou.com`）实现搜索、播放、歌单、登录等能力，并提供桌面端与移动端两套自适应布局。

> 本项目为个人学习/二次开发用途，接口调用遵循酷狗公开网关协议，未经官方授权请勿用于商业发布。

---

## 🧱 技术栈

| 维度 | 选型 |
| --- | --- |
| 框架 | Flutter 3.44.1（开发验证环境） |
| 语言 | Dart 3.12.1（pubspec 约束 `sdk: ^3.10.8`） |
| 状态管理 / 路由 / 依赖注入 | **GetX（get）** |
| 音频播放 | **just_audio** + **audioplayers** + **just_audio_background** + **audio_session** |
| 本地存储 | **get_storage**（轻量 KV）、**sqflite** + **sqflite_common_ffi**（结构化缓存） |
| 网络请求 | **dio** |
| 数据建模 | **freezed** + **json_serializable**（代码生成） |
| UI 组件 | **flutter_lyric**（歌词）、**flutter_animate**（动画）、**percent_indicator**、**animated_text_kit**、**flutter_svg**、**layout**（响应式布局） |
| 加解密 | **encrypt** + **pointycastle** + **crypto** + **archive** + **basic_utils**（PEM 解析） |
| 测试 | **flutter_test**、**integration_test**、**flutter_lints** |

---

## 📦 第三方依赖清单（已锁定版本）

### 运行时依赖（dependencies）

| 分类 | 包名 | 版本 | 用途 |
| --- | --- | --- | --- |
| 状态/路由 | `get` | 4.7.3 | GetX 状态管理、路由、依赖注入 |
| 音频 | `just_audio` | 0.10.6 | 核心音频播放引擎 |
| 音频 | `audioplayers` | 6.8.1 | 播放控制封装 |
| 音频 | `just_audio_background` | 0.0.1-beta.17 | 后台播放 / 通知栏控制 |
| 音频 | `just_audio_windows` | 0.2.3 | Windows 平台音频后端 |
| 音频 | `audio_session` | 0.2.4 | 系统音频焦点/会话管理 |
| 存储 | `get_storage` | 2.1.1 | 轻量级本地 KV 存储（用户态/配置） |
| 存储 | `sqflite` | 2.4.3 | 结构化本地数据库 |
| 存储 | `sqflite_common_ffi` | 2.4.2 | 桌面端（Win/macOS/Linux）SQLite FFI |
| 存储 | `path_provider` | 2.1.6 | 获取系统目录路径 |
| 存储 | `cached_network_image` | 3.4.1 | 网络图片缓存 |
| 网络 | `dio` | 5.10.0 | HTTP 客户端（含拦截与签名） |
| 建模 | `freezed_annotation` | 3.1.0 | 不可变模型注解 |
| 建模 | `json_annotation` | 4.12.0 | JSON 序列化注解 |
| UI | `layout` | 1.0.5 | 响应式断点布局 |
| UI | `flutter_lyric` | 3.0.7 | 歌词逐行高亮滚动 |
| UI | `flutter_animate` | 4.5.2 | 声明式动画 |
| UI | `percent_indicator` | 4.2.5 | 播放进度/环形指示器 |
| UI | `animated_text_kit` | 4.3.0 | 文字动效（如加载态） |
| UI | `flutter_svg` | 2.3.0 | SVG 资源渲染 |
| UI | `cupertino_icons` | 1.0.9 | iOS 风格图标 |
| UI | `icons_launcher` | 2.1.7 | 应用图标生成工具 |
| 加解密 | `encrypt` | 5.0.3 | AES 等对称加密 |
| 加解密 | `pointycastle` | 3.9.1 | 底层加密算法库 |
| 加解密 | `crypto` | 3.0.7 | 哈希（MD5 等） |
| 加解密 | `archive` | 4.0.9 | 压缩/解压（资源处理） |
| 加解密 | `basic_utils` | 5.7.0 | PEM 公钥解析 |

### 开发依赖（dev_dependencies）

| 包名 | 版本 | 用途 |
| --- | --- | --- |
| `flutter_test` | SDK | 单元/Widget 测试 |
| `integration_test` | SDK | 集成（端到端）测试 |
| `flutter_lints` | 6.0.0 | 静态分析与代码规范 |
| `build_runner` | 2.4.13 | 代码生成驱动器 |
| `freezed` | 3.2.5 | freezed 代码生成 |
| `json_serializable` | 6.14.0 | JSON 序列化代码生成 |

---

## 🗂️ 项目结构

```
lib/
├── api/                 # 网络层：按业务拆分（login / playlist / song / search / top / user）+ request 封装与签名
├── bindings/           # GetX 依赖绑定（MusicBinding）
├── config/             # 应用常量与加密工具（config.dart / encrypt_ext.dart / util.dart）
├── controllers/        # GetX 控制器（MusicController 等）
├── models/             # 数据模型（freezed + json_serializable，含 search / user 子目录）
├── services/           # 业务服务：AudioService / SongCacheService / LyricCacheService / PlayHistoryService
├── store/              # 全局用户态存储（user.dart）
├── views/              # 页面 UI
│   ├── home/mobile/    # 移动端布局
│   ├── home/pc/        # 桌面端布局（sidebar / title_bar / bottom_control / router）
│   ├── login/          # 登录（密码 / 二维码）
│   ├── music/          # 播放页 / 当前播放列表
│   ├── playlist/       # 歌单详情
│   ├── search/         # 搜索
│   └── my/             # 个人中心
├── widgets/            # 可复用组件（旋转封面、加入歌单弹窗等）
└── main.dart           # 应用入口（初始化后台播放、存储、设备注册）
```

> 桌面端与移动端通过 `MediaQuery` 的宽高比自动切换：`size.width < size.height` 走移动布局，否则走 PC 布局。

---

## 🚀 如何运行

### 1. 环境准备

- 安装 [Flutter SDK](https://docs.flutter.dev/get-started/install)（推荐 3.44.1，Dart ≥ 3.10.8）
- 配置目标平台工具链：
  - **Android**：Android SDK + 设备/模拟器
  - **iOS**：Xcode + 模拟器/真机（macOS）
  - **Windows**：Visual Studio（含“桌面开发” workloads）
  - **macOS / Linux**：对应平台编译工具链
- 运行 `flutter doctor` 确认环境无误

### 2. 获取依赖

```bash
flutter pub get
```

### 3. 代码生成（freezed / json_serializable）

模型层使用了 `freezed` 与 `json_serializable`，首次拉取代码或改动模型后需生成 `*.freezed.dart` / `*.g.dart`：

```bash
# 一次性生成（推荐，自动覆盖冲突文件）
flutter pub run build_runner build --delete-conflicting-outputs

# 或监听模式（开发模型时自动重建）
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 4. 启动应用

```bash
# 默认设备（flutter devices 中第一个）
flutter run

# 指定平台，例如桌面端
flutter run -d windows
flutter run -d macos
flutter run -d linux

# 指定模拟器 / 真机
flutter run -d <deviceId>
```

应用启动时会自动向酷狗网关完成设备注册（`register_dev`）以获取 `dfid`，无需手动配置。

### 5. 构建发布包

```bash
flutter build apk            # Android
flutter build ios            # iOS（需 macOS）
flutter build windows        # Windows
flutter build macos          # macOS
flutter build linux          # Linux
```

---

## 🧪 测试

### 单元测试 / Widget 测试

```bash
flutter test
```

覆盖 `controllers / models / services / views / widgets` 五个目录。

### 集成测试

```bash
# 需在 Android / iOS 模拟器或真机上运行（依赖真实音频后端）
flutter test integration_test/app_flow_test.dart
```

> 说明：集成测试通过 `tester.pumpWidget(const MyApp())` 直接挂载，跳过 `JustAudioBackground.init()`，并以 `MockHttpClientAdapter` 拦截 `/search/complex` 接口；每个用例前通过 `Get.reset()` + 重新初始化存储做隔离。桌面无通知环境无法跑该集成测试。

---

## 🔑 配置说明（开发者）

应用常量集中在 `lib/config/config.dart`：

- `isLite`：是否为极速版（影响 `appid` / `clientver`）
- `appid` / `clientver` / `liteAppid` / `liteClientver` / `srcappid`：酷狗客户端标识
- `wx_appid` / `wx_secret` 等：微信相关（如需要）
- 接口网关：`https://gateway.kugou.com`（`lib/api/request/request.dart` 中 `SERVER_API_URL`）
- 请求签名：支持 `android` / `web` / `register` 三种 `encryptType`，由 `config/encrypt_ext.dart` 实现

> ⚠️ 这些为客户端常量，已硬编码在源码中，仅供学习调试使用。

---

## 📝 开发规范

- 静态分析：`flutter analyze`（基于 `flutter_lints`）
- 模型改动后务必重新执行 build_runner
- 新增依赖请在 `pubspec.yaml` 显式声明，并同步更新本文件依赖清单
- 桌面端 SQLite 使用 `sqflite_common_ffi`；移动端使用原生 `sqflite`

---

## 📄 License

仅供学习交流，禁止商业使用。酷狗及相关商标归原权利方所有。
