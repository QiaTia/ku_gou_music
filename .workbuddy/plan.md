# 项目分析 + integration_test 端到端测试流程方案

## 一、项目分析结论（交付物 1：分析文档）

### 1.1 本质
- **Flutter 3.44.1 / Dart 3.12.1 的酷狗音乐客户端（GetX 架构）**，不是 Web 应用，无 `web/` 目录。之前称为"Web 应用"是误判。
- 上次已把单元/Widget 测试修复到 **67 个全绿**（含 GetStorage 并行锁 flaky 修复）。

### 1.2 分层架构
| 层 | 位置 | 说明 |
|---|---|---|
| UI | `lib/views/` | 按 home/music/search/playlist/login/my 组织，PC/Mobile 双布局 |
| 页面级控制器 | `lib/views/**/*.controller.dart` | RecentlyController / SearchController / PlaylistController 等 |
| 全局控制器 | `lib/controllers/music_controller.dart` | 播放控制（包装 AudioService） |
| 服务 | `lib/services/` | AudioService / SongCacheService / PlayHistoryService / LyricCacheService |
| 模型 | `lib/models/` | search/*、song、user/*，大量 freezed 生成 |
| 接口 | `lib/api/` | `request/request.dart`（dio 封装，含 top-level `final dio`）、`search/search.dart` 等 |
| 绑定 | `lib/bindings/music_binding.dart` | `initialBinding`，lazyPut AudioService + MusicController |

### 1.3 导航（双层路由）
- 顶层 `GetMaterialApp.routes`：`/player`、`/playlist`、`/login`、`/playlist/detail`（用 `Get.toNamed`）。
- 嵌套 `LocalRouter`：`/home /plaza /ranking /recently /my /search`（PC 用 `sidebar` + `LocalRouterController.navigateTo`，移动用底部 Tab）。

### 1.4 依赖注入顺序（关键约定，违反即崩）
`SongCacheService` → `AudioService`（构造里 `Get.find<SongCacheService>()`）→ `MusicController`（构造里 `Get.find<AudioService>()`）。

### 1.5 可测性现状 / 已知坑
- **无任何 test Key / Semantics**：UI 只能靠 `find.text` / `find.byIcon` / `find.byType` 定位；中文重复文本多（如多个"搜索"按钮），定位脆弱。
- 搜索走真实网络（dio → 酷狗网关）；播放走 `just_audio`（需真实音频设备）。
- `main()` 含设备相关初始化：`JustAudioBackground.init()`、网络 `registerDevice()`，integration_test 需绕开。

### 1.6 核心用户旅程（本次 E2E 覆盖对象）
1. **启动 & 导航**：App 启动 → 主页渲染 → 侧栏进入"最近播放"/"搜索"。
2. **搜索**：输入关键词 → 点搜索 → 综合结果列表渲染 → Tab 切换（综合/单曲/歌单/专辑/MV/歌手）。
3. **播放控制**：装歌到播放列表 → 点播放/暂停 → 状态翻转 → 下一首切换。

---

## 二、integration_test 方案（交付物 2：测试代码）

### 2.1 依赖
`pubspec.yaml` 的 `dev_dependencies` 增加：
```yaml
integration_test: ^1.0.0
```

### 2.2 新增文件
```
integration_test/
├── test_helper.dart   # 依赖初始化 + GetStorage + dio mock 注入 + FakeAudioService 注册 + TestApp 桩
├── mocks.dart         # MockSearchAdapter(dio HttpClientAdapter) + fixtures + FakeAudioService
└── app_flow_test.dart # 3 条流程
```

### 2.3 Mock 策略（决定可在无设备/无网络环境跑）
- **网络**：`import 'package:ku_gou_music/api/request/request.dart'` 拿到 top-level `dio`，在 `setUp` 注入
  `dio.httpClientAdapter = MockSearchAdapter()`。
  - 匹配 `complexsearch.kugou.com/v6/search/complex` 与 `gateway.kugou.com/v3/search/song*` 返回 **fixture JSON**（保留真实 `SearchController → searchComplex → SearchComplexResponse.fromJson → UI` 全链路）。
  - **未匹配的 URL 一律返回 `{status:1, data:{}}`**，使主页推荐等其它接口在安全空数据下渲染，不崩。
- **音频**：`FakeAudioService`（实现/继承 `AudioService`，覆写 `play/pause/next/previous/seek/setPlaylist/setVolume` 等，驱动 `audioState/currentSong/songList/position/duration` 等 Rx 变量，**不接 just_audio**）。在 `TestApp` 初始化时**先于** `MusicController` 注册，使 `Get.find<AudioService>()` 命中 fake。

### 2.4 TestApp 测试桩（复刻 main 的路由，绕开设备初始化）
- 复用 `GetMaterialApp(home: HomePage()/MobileLayoutPage(), routes: <同 main 路由表>)`，**不调用** `JustAudioBackground.init()` / `registerDevice()`。
- `setUpAll`：`GetStorage.init()`（单进程，无需临时目录规避并行锁）→ 注册 `FakeAudioService` → `MusicController` → 注入 `dio` mock → `pumpWidget(TestApp())`。
- `tearDownAll`：`Get.reset()`。

### 2.5 给关键控件加 test Key（少量、最小侵入）
- `TitleSearchField` 的 `TextField` → `Key('search_input')`
- 搜索页"搜索"按钮（`search.dart:60` `TextButton`）→ `Key('search_submit')`
- `BottomControl` 播放/暂停 `IconButton`（`bottom_control.dart:98`，tooltip '播放 / 暂停'）→ `Key('play_pause_button')`
- 最近播放 Tab 项 / 歌曲项 → `Key('recently_tab_$i')` / `Key('recently_song_$id')`
- 搜索结果歌曲项 → `Key('search_result_song_$hash')`

### 2.6 三条测试流程（AAA 结构，命名 `should_..._when_...`）
1. **启动与导航冒烟**：`pumpWidget(TestApp())` → `expect(find.byType(HomePage), findsOneWidget)`（或断言外壳文本）→ 点击侧栏"最近播放" → `expect(find.text('最近播放'), findsOneWidget)`；点击"搜索" → `expect(find.byType(SearchPage), findsOneWidget)`。
2. **搜索流程（mock 网络）**：进入搜索页 → `enterText(find.byKey(Key('search_input')), '周杰伦')` → `tap(find.byKey(Key('search_submit')))` → `await` 轮询 `expect(find.text(<fixture 歌曲名>), findsWidgets)` → 切 Tab '单曲'（`tap(find.text('单曲'))`）→ 断言单曲列表出现。
3. **播放控制流程（mock 音频）**：`FakeAudioService.setPlaylist([songA, songB])` → `pumpWidget(TestApp())` → `tap(find.byKey(Key('play_pause_button')))` → `expect(Get.find<MusicController>().isPlaying, isTrue)` 且 UI 显示 `Icons.pause` → `tap` 下一首 → `expect(Get.find<MusicController>().currentSong?.hash, songB.hash)`。

### 2.7 运行与验证
- 命令：`flutter test integration_test`（桌面需 Windows/macOS/Linux runner；移动需连接设备或模拟器）。
- 本沙箱为 **Windows 桌面**：首次运行会编译原生 C++ runner，需 **Visual Studio 生成工具**。若工具链缺失，将明确报告并改为"产出可运行代码 + 本地运行说明"，不强行在此环境跑。
- 目标：3 条流程全绿；连跑 2 次确认非 flaky。

### 2.8 交付物清单
- `analysis/PROJECT_ANALYSIS.md` —— 项目分析文档（含架构图、测试现状、风险）。
- `integration_test/test_helper.dart` / `mocks.dart` / `app_flow_test.dart` —— 端到端测试代码。
- 运行说明（附于分析文档末尾）。

### 2.9 风险与对策
- **FakeAudioService 接口对齐**：实现阶段需完整读取 `audio_service.dart` 的 public 方法与 Rx 变量，确保 fake 覆盖 `MusicController` 用到的一切。
- **主页/广场等页面也发网络请求**：靠 MockSearchAdapter 的"未匹配返回安全空数据"兜底，使非搜索页面也能渲染；启动冒烟只断言外壳与导航可达，不依赖具体数据。
- **cached_network_image 加载封面**：无网络时走 placeholder/errorWidget（代码已处理），不影响断言。
