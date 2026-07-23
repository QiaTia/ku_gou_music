# 项目记忆（ku_gou_music）

## 本质
- 这是 **Flutter/Dart 音乐 App（酷狗音乐客户端）**，**不是 Web 应用**。无 `web/` 目录。
- 架构：GetX（Get.put/Get.find 依赖注入）+ audioplayers/just_audio（播放）+ get_storage + dio + freezed + sqflite。

## 测试套件状态（2026-07-22）
- 工具链：Flutter 3.44.1 / Dart 3.12.1；`flutter test` 跑单元/Widget 测试。
- 基线：修复后 **67 个用例全部通过**，连跑 2 次稳定（无 flaky）。
- 关键约定：**任何用到 GetStorage 的测试文件，path_provider mock 必须返回各自独立的 `Directory.systemTemp.createTemp(...)` 目录**，否则 `flutter test` 并行跑多文件时会争用同一 `.\GetStorage.gs` 文件锁（errno=33）导致偶发失败。

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
