# 项目记忆（ku_gou_music）

## 本质
- 这是 **Flutter/Dart 音乐 App（酷狗音乐客户端）**，**不是 Web 应用**。无 `web/` 目录。
- 架构：GetX（Get.put/Get.find 依赖注入）+ audioplayers/just_audio（播放）+ get_storage + dio + freezed + sqflite。

## 测试套件状态
- 工具链：Flutter 3.44.1 / Dart 3.12.1；`flutter test` 跑单元/Widget 测试。
- 2026-09-11：`flutter analyze` 0 error；`flutter test` **73 通过 / 1 失败**。唯一失败 `test/controllers/recently_controller_test.dart: playSong 应该将歌曲移到最前面` 是**既有失败**（已在 HEAD ba28beb 上复现）：单测无 just_audio 平台实现 → `setPlaylist` 抛异常 → `Get.snackbar` 在无 overlay 的测试环境崩（`SnackbarController._configureOverlay` Null check）。
- 关键约定：**任何用到 GetStorage 的测试文件，path_provider mock 必须返回各自独立的 `Directory.systemTemp.createTemp(...)` 目录**，否则 `flutter test` 并行跑多文件时会争用同一 `.\GetStorage.gs` 文件锁（errno=33）导致偶发失败。

## 酷狗接口约定（2026-09-11 真实接口实测）
- **歌单详情 `/pubsongs/v2/get_other_list_file_nofilt` 的 `global_collection_id` 只接受 gid**（形如 `collection_3_2132029040_287_0`）。
  - 传数字 specialid → `error_code=20010` 且 `data` 为空对象（**不抛异常**，旧代码表现为页面永久转圈）。
  - 传 gcid_xxx（egid）同样无效。所有可用入口（首页/广场/我的/搜索歌单 Tab）都传 gid。
- `AudioService` 索引不变式：`songList[i]` ↔ `playlist[i]` 必须等长。`player.insertAudioSource(i, src)` 是「在 i 处插入」（序列会变长），但只要总插在自身索引 i 处，i 之前的映射不受影响，因此该方案可工作（勿改成 `addAudioSource` 追加到末尾）。
- `_prefetchSong` 会被 `isLoadingIndices` 拦截 → 「立即播放刚入队的歌」前必须先等它结束（`AudioService.addAndPlay` 已内置）。
- 接口签名：web 用 salt `NVPh5oo715z5DIWAeQlhMDsWXXQV4hwt` + appid 1014 + dfid=- 可匿名调 `/v1/search/*`、`/v2/search/song`；app(android) 用 salt `LnT6xpN3khm36zse0QzvmgTZ3waWdRSA`（isLite）+ appid 3116/clientver 11440，`/v6/search/complex` 与 gateway 接口还需设备注册 dfid，否则返回 20006。

## 运行环境（安卓模拟器）
- **Android SDK 不在默认路径**，而在 `D:\runtime`（含 emulator / system-images / platforms / build-tools 全套）。已持久化用户级 `ANDROID_HOME=D:\runtime` 与 `ANDROID_SDK_ROOT=D:\runtime`。
- 可用虚拟设备：`Pixel_10`（AVD，`~/.android/avd/Pixel_10.avd`，基于 `android-37.1` 镜像，x86_64）。
- 启动命令：`"$ANDROID_HOME/emulator/emulator.exe" -avd Pixel_10 -gpu swiftshader -no-audio`（软件渲染，无 GPU 也能跑）。用 `adb wait-for-device` + `getprop sys.boot_completed` 轮询启动。
- 运行：`flutter run -d emulator-5554`（需同时导出 `JAVA_HOME`=Amazon Corretto，Gradle 用 JDK17）。
- 首次安卓构建约 100s，`√ Built ...app-debug.apk` 后安装到 `cn.tia.ku_gou_music`。
- 已知构建告警（非致命）：`audioplayers_android` 的 Kotlin 增量编译缓存因 C:/D: 跨盘根报错（“this and base files have different roots”），但构建仍成功；另有 Kotlin Gradle Plugin 迁移提示（未来版本会失败，建议迁 Built-in Kotlin）。
- 模拟器上 API（歌单/用户详情）同样返回 `error_code 20017/20018/31863` 且触发登录失效——酷狗 API 版权/鉴权限制，非代码 bug。

## 已知坑
- `AudioService` 构造函数依赖 `Get.find<SongCacheService>()`；测试里注册顺序必须是 `SongCacheService → AudioService → MusicController`。
- 模型重构频繁（如 `SearchComplexResponse` 由直接 getter 改为 `lists→SearchComplexGroup→扩展 getter`），改模型后记得同步改测试。

## 集成测试（integration_test）约定（2026-07-22 新增）
- 文件：`integration_test/app_flow_test.dart` + `integration_test/mock/search_mock_adapter.dart`；`pubspec.yaml` 已加 `integration_test: sdk: flutter`。
- 启动方式：**直接 `tester.pumpWidget(const MyApp())`，不要调用 `main()`**，从而跳过 `JustAudioBackground.init()`（桌面/无通知环境会崩）。但 `MyApp` 的 `MusicBinding` 仍会 lazy 创建 `AudioService`（HomePage 构建时），需真实音频后端 → **集成测试要跑在 Android/iOS 模拟器或真机**。
- 强制 PC 布局：`await tester.binding.setSurfaceSize(const Size(1280, 800))`（`MyApp` 用 `size.width < size.height` 区分移动/桌面）。
- 网络 Mock：`dio.httpClientAdapter = MockHttpClientAdapter()`，仅拦截 `/search/complex` 返回本地 JSON，其余请求透传真实网络。
- 播放控制离线可测：`AudioService._generateSilenceSource` 用 1 秒静音 WAV 的 data URI 占位，预载假 `SongItemStruct` 即可驱动 play/pause/next，不触发真实音频请求。
- 每个用例前用 `Get.reset()` + 重新 `GetStorage.init()/userInstance.init()/SongCacheService.init()` 做隔离。
