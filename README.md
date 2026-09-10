# 酷狗音乐客户端（ku_gou_music）

一个基于 **Flutter** 的第三方酷狗音乐客户端，支持 Android / iOS / Windows / macOS / Linux 多端运行。采用 GetX 进行状态管理与依赖注入，复用酷狗官方网关接口（`gateway.kugou.com`），并提供桌面端与移动端两套自适应布局。

> 本项目为个人学习/二次开发用途，接口调用遵循酷狗公开网关协议，未经官方授权请勿用于商业发布。

## ✨ 功能特性

- **多端自适应**：根据屏幕宽高比自动切换移动端（液态玻璃 TabBar + 迷你播放条）/ PC 端（侧边栏 + 标题栏 + 底部控制条）布局
- **搜索**：综合搜索（单曲 / 歌单 / 专辑 / MV / 歌手 / 歌词多类型结果）
- **播放**：多音质切换、后台播放 / 通知栏控制（just_audio_background）、随机 / 单曲 / 列表循环、播放历史
- **歌单**：排行榜 / 推荐歌单、歌单详情、加入 / 移除歌单曲目
- **登录**：账号密码登录、二维码扫码登录
- **本地化**：歌曲缓存（SQLite）、歌词缓存、用户态持久化（GetStorage）

## 🧱 技术栈

| 维度 | 选型 |
| --- | --- |
| 框架 / 语言 | Flutter 3.44.1 · Dart（SDK `^3.10.8`） |
| 状态管理 / 路由 / DI | GetX |
| 音频 | just_audio + audioplayers + just_audio_background + audio_session |
| 存储 | get_storage（KV）· sqflite / sqflite_common_ffi（SQLite，桌面端 FFI） |
| 网络 | dio |
| 数据建模 | freezed + json_serializable（代码生成） |
| 加解密 | encrypt · pointycastle · crypto · archive · basic_utils |

完整依赖清单与分层架构说明见 [docs/architecture.md](docs/architecture.md)。

## 🚀 快速开始

### 1. 环境准备

- 安装 [Flutter SDK](https://docs.flutter.dev/get-started/install)（推荐 3.44.1），运行 `flutter doctor` 确认环境无误
- 按目标平台配置工具链：Android SDK / Xcode（iOS、macOS）/ Visual Studio 桌面开发（Windows）

### 2. 获取依赖并生成代码

模型层使用 `freezed` + `json_serializable`，首次拉取或改动模型后需重新生成：

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. 运行与构建

```bash
flutter run                    # 默认设备
flutter run -d windows         # 指定平台 / 设备

flutter build apk              # Android
flutter build windows          # Windows
flutter build macos            # macOS
```

应用启动时会自动向酷狗网关完成设备注册（`register_dev`）获取 `dfid`，无需手动配置。

## 🧪 测试

```bash
flutter test                                        # 单元 / Widget 测试
flutter test integration_test/app_flow_test.dart    # 集成测试（需模拟器/真机）
```

> 集成测试通过 `MockHttpClientAdapter` 拦截 `/search/complex` 接口并注入 `FakeAudioService`，不依赖真实网络与音频设备；每个用例前通过 `Get.reset()` 隔离。桌面端无通知栏环境不可运行。

## 📦 发布

推送 `v*` 格式的 tag 即触发 GitHub Actions 跨平台打包（Android APK/AAB、iOS、macOS、Windows、Linux，按 CPU 架构拆分）并自动创建 Release。详见 [docs/release.md](docs/release.md)。

## 🗂️ 项目结构

```
lib/
├── api/                 # 网络层：login / playlist / song / search / top / user + request 封装与签名
├── bindings/            # GetX 依赖绑定（MusicBinding）
├── config/              # 应用常量与加密工具（config / encrypt_ext / util）
├── controllers/         # 全局控制器（MusicController）
├── models/              # 数据模型（freezed + json_serializable，含 search / user 子目录）
├── services/            # 业务服务：AudioService / SongCacheService / LyricCacheService / PlayHistoryService
├── store/               # 全局用户态存储（user.dart）
├── utils/               # 通用工具函数
├── views/               # 页面 UI（home 双端布局 / login / music / playlist / search / my）
│   ├── home/mobile/     # 移动端布局（液态玻璃 TabBar、迷你播放条）
│   └── home/pc/         # 桌面端布局（sidebar / title_bar / bottom_control / plaza / ranking / recently / router）
├── widgets/             # 可复用组件（旋转封面、加入歌单弹窗等）
└── main.dart            # 应用入口
```

架构分层、依赖注入顺序与双层路由说明见 [docs/architecture.md](docs/architecture.md)。

## 🔑 配置说明

应用常量集中在 [lib/config/config.dart](lib/config/config.dart)：`isLite`（极速版标识，影响 `appid` / `clientver`）、酷狗客户端标识、`mid` 生成等。接口网关为 `https://gateway.kugou.com`，请求签名支持 `android` / `web` / `register` 三种方式，详见 [docs/api.md](docs/api.md)。

## 📝 开发规范

- 静态分析：`flutter analyze`（基于 `flutter_lints`）
- 模型改动后务必重新执行 build_runner
- 新增依赖请在 `pubspec.yaml` 显式声明

## 📄 License

仅供学习交流，禁止商业使用。酷狗及相关商标归原权利方所有。
