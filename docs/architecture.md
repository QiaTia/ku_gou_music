# 架构说明

本项目基于 Flutter + GetX，采用分层架构 + 双端自适应布局。本文档描述代码组织、依赖注入约定、路由体系与各层职责。

## 分层架构

```
┌─────────────────────────────────────────────┐
│ views/          UI 层（PC / Mobile 双布局）   │
│  └── *.controller.dart  页面级 GetxController │
├─────────────────────────────────────────────┤
│ controllers/    全局控制器（MusicController） │
├─────────────────────────────────────────────┤
│ services/       业务服务（音频 / 缓存 / 历史） │
├─────────────────────────────────────────────┤
│ api/            网络层（dio 封装 + 签名）      │
│ models/         数据模型（freezed 不可变）     │
│ store/          全局用户态（GetStorage）       │
└─────────────────────────────────────────────┘
```

| 层      | 位置                                      | 职责                                                                       |
| ------ | --------------------------------------- | ------------------------------------------------------------------------ |
| UI     | `lib/views/`                            | 按 home / music / search / playlist / login / my 组织，PC / Mobile 双布局       |
| 页面级控制器 | `lib/views/**/*.controller.dart`        | SearchController / PlaylistController / RecentlyController 等，仅服务单个页面     |
| 全局控制器  | `lib/controllers/music_controller.dart` | 播放控制，包装 AudioService 对外暴露                                                |
| 服务     | `lib/services/`                         | AudioService / SongCacheService / PlayHistoryService / LyricCacheService |
| 网络层    | `lib/api/`                              | 按业务域拆分；`request/request.dart` 提供 dio 封装与签名（详见 [api.md](api.md)）          |
| 模型     | `lib/models/`                           | `search/`、`user/` 子目录，freezed + json\_serializable 生成不可变模型               |
| 绑定     | `lib/bindings/music_binding.dart`       | `initialBinding`，lazyPut AudioService + MusicController                  |
| 用户态    | `lib/store/user.dart`                   | `User` 单例（`userInstance`），GetStorage 持久化 token / dfid / userid           |

## 依赖注入顺序（关键约定）

初始化顺序违反会导致运行时崩溃，必须遵守：

```
main()
 ├── JustAudioBackground.init()          # 必须在 runApp 之前
 ├── GetStorage.init()
 ├── Get.putAsync<SongCacheService>(...)  # SongCacheService 最先注册
 └── runApp(MyApp())
      └── initialBinding: MusicBinding()
           ├── Get.lazyPut(() => AudioService())     # 构造中 Get.find<SongCacheService>()
           └── Get.lazyPut(() => MusicController())  # 构造中 Get.find<AudioService>()
```

即：**SongCacheService → AudioService → MusicController**，逐级依赖，前者必须先注册。

测试中需要替换依赖时（如集成测试注入 `FakeAudioService`），必须先于 `MusicController` 注册 fake，使 `Get.find<AudioService>()` 命中注入实例；每个用例前通过 `Get.reset()` + 重新初始化存储做隔离。

## 双层路由体系

### 顶层路由（GetMaterialApp）

定义于 `lib/main.dart`，整页跳转用 `Get.toNamed`：

| 路由                 | 页面                                                  |
| ------------------ | --------------------------------------------------- |
| `/player`          | 播放页（MusicPlayerScreen）                              |
| `/playlist`        | 当前播放列表（CurrentPlaylistScreen）                       |
| `/login`           | 登录页（LoginPage）                                      |
| `/playlist/detail` | 歌单详情（PlaylistScreen，通过 arguments 传 name / id / pic） |

### 嵌套路由（LocalRouter）

PC 端在主布局内部维护独立 `Navigator`（`lib/views/home/pc/router/router.dart`）：

- 路由表：`/home`、`/plaza`、`/ranking`、`/recently`、`/my`、`/search`

- PC 端通过 sidebar 调用 `LocalRouterController.navigateTo()` 切换；移动端通过底部 Tab 切换

- `LocalRouterController` 维护 `openRouteList` 栈与 `canBack` 状态，支持内层返回

## 双端自适应布局

`MyApp.build` 中按屏幕宽高比切换：

```dart
final isMobile = size.width < size.height;
home: isMobile ? const MobileLayoutPage() : const HomePage(),
```

- **移动端**（`lib/views/home/mobile/`）：液态玻璃悬浮 TabBar（`liquid_glass_bottom_bar.dart`）+ 迷你播放条（`mini_player_bar.dart`，无歌曲时自动折叠），`Stack` + `SafeArea` 层级布局

- **PC 端**（`lib/views/home/pc/`）：`layout/`（sidebar / title\_bar / bottom\_control）承载框架，内部嵌套 LocalRouter 渲染 home / plaza / ranking / recently 等页面

## 服务层

### AudioService（`lib/services/audio_service.dart`）

核心播放引擎，包装 `just_audio` 的 `AudioPlayer`：

- **逻辑歌单与播放器分离**：`songList` 只存歌曲元数据（RxList<SongItemStruct>），`playlist` 为懒加载的 AudioSource 列表（按需获取播放 URL）

- `playlistGeneration` 代数计数器：每次 `setPlaylist` 自增，让旧的后台预加载任务自动失效

- 监听 `audio_session` 中断事件（耳机拔出自动暂停、通话结束恢复）

- 暴露 Rx 状态：`audioState` / `position` / `duration` / `currentSong` / `isBuffering` / `volume` / `loopMode` 等

### 缓存与历史

| 服务                 | 存储                                     | 说明              |
| ------------------ | -------------------------------------- | --------------- |
| SongCacheService   | SQLite（sqflite / sqflite\_common\_ffi） | 歌曲文件缓存，桌面端走 FFI |
| LyricCacheService  | SQLite                                 | 歌词缓存            |
| PlayHistoryService | —                                      | 播放历史记录          |

桌面端 SQLite 统一使用 `sqflite_common_ffi`，移动端使用原生 `sqflite`。

## 模型层与代码生成

模型使用 `freezed` + `json_serializable`：

- 手写文件为 `*.dart`，生成产物为 `*.freezed.dart` 与 `*.g.dart`（均已提交）

- 改动模型后执行：

```bash
flutter pub run build_runner build --delete-conflicting-outputs
# 开发时监听模式
flutter pub run build_runner watch --delete-conflicting-outputs
```

- 类型转换器位于 `lib/models/converters/`（如 `int_from_string_converter.dart` 处理接口返回字符串数字）

## 用户态（store/user.dart）

- `User` 单例（全局 `userInstance`），启动时 `init()` 从 GetStorage 恢复

- 维护 `token` / `dfid` / `userid` / `nickname` / `pic`

- `dfid` 为设备注册标识：首次启动时 `main()` 调用 `registerDevice()`（`lib/api/login/register_dev.dart`）向酷狗网关注册获取

## 第三方依赖清单（已锁定版本）

### 运行时依赖

| 分类    | 包名                      | 版本            | 用途                             |
| ----- | ----------------------- | ------------- | ------------------------------ |
| 状态/路由 | `get`                   | 4.7.3         | GetX 状态管理、路由、依赖注入              |
| 音频    | `just_audio`            | 0.10.6        | 核心音频播放引擎                       |
| 音频    | `audioplayers`          | 6.8.1         | 播放控制封装                         |
| 音频    | `just_audio_background` | 0.0.1-beta.17 | 后台播放 / 通知栏控制                   |
| 音频    | `just_audio_windows`    | 0.2.3         | Windows 平台音频后端                 |
| 音频    | `audio_session`         | 0.2.4         | 系统音频焦点/会话管理                    |
| 存储    | `get_storage`           | 2.1.1         | 轻量级本地 KV 存储（用户态/配置）            |
| 存储    | `sqflite`               | 2.4.3         | 结构化本地数据库                       |
| 存储    | `sqflite_common_ffi`    | 2.4.2         | 桌面端（Win/macOS/Linux）SQLite FFI |
| 存储    | `path_provider`         | 2.1.6         | 获取系统目录路径                       |
| 存储    | `cached_network_image`  | 3.4.1         | 网络图片缓存                         |
| 网络    | `dio`                   | 5.10.0        | HTTP 客户端（含拦截与签名）               |
| 建模    | `freezed_annotation`    | 3.1.0         | 不可变模型注解                        |
| 建模    | `json_annotation`       | 4.12.0        | JSON 序列化注解                     |
| UI    | `layout`                | 1.0.5         | 响应式断点布局                        |
| UI    | `flutter_lyric`         | 3.0.7         | 歌词逐行高亮滚动                       |
| UI    | `flutter_animate`       | 4.5.2         | 声明式动画                          |
| UI    | `percent_indicator`     | 4.2.5         | 播放进度/环形指示器                     |
| UI    | `animated_text_kit`     | 4.3.0         | 文字动效（如加载态）                     |
| UI    | `flutter_svg`           | 2.3.0         | SVG 资源渲染                       |
| UI    | `cupertino_icons`       | 1.0.9         | iOS 风格图标                       |
| UI    | `icons_launcher`        | 2.1.7         | 应用图标生成工具                       |
| 加解密   | `encrypt`               | 5.0.3         | AES 等对称加密                      |
| 加解密   | `pointycastle`          | 3.9.1         | 底层加密算法库                        |
| 加解密   | `crypto`                | 3.0.7         | 哈希（MD5 等）                      |
| 加解密   | `archive`               | 4.0.9         | 压缩/解压（资源处理）                    |

### 开发依赖

| 包名                  | 版本     | 用途            |
| ------------------- | ------ | ------------- |
| `flutter_test`      | SDK    | 单元/Widget 测试  |
| `integration_test`  | SDK    | 集成（端到端）测试     |
| `flutter_lints`     | 6.0.0  | 静态分析与代码规范     |
| `build_runner`      | 2.4.13 | 代码生成驱动器       |
| `freezed`           | 3.2.5  | freezed 代码生成  |
| `json_serializable` | 6.14.0 | JSON 序列化代码生成  |
| `basic_utils`       | 5.7.0  | PEM 公钥解析（签名用） |

## 可测性现状与已知约束

- **无 test Key / Semantics**：UI 测试只能靠 `find.text` / `find.byIcon` / `find.byType` 定位；中文重复文本多（如多个"搜索"按钮），定位脆弱

- 搜索走真实网络（dio → 酷狗网关）；播放走 `just_audio`（需真实音频设备）。集成测试通过替换 `dio.httpClientAdapter` 与注入 `FakeAudioService` 绕开

- `main()` 含设备相关初始化（`JustAudioBackground.init()`、网络 `registerDevice()`），集成测试通过 `tester.pumpWidget(const MyApp())` 直接挂载以跳过

