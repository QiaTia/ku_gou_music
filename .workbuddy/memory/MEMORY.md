# 项目记忆（ku_gou_music）

## 本质
- 这是 **Flutter/Dart 音乐 App（酷狗音乐客户端）**，**不是 Web 应用**。无 `web/` 目录。
- 架构：GetX（Get.put/Get.find 依赖注入）+ audioplayers/just_audio（播放）+ get_storage + dio + freezed + sqflite。

## 测试套件状态
- 工具链：Flutter 3.44.1 / Dart 3.12.1；`flutter test` 跑单元/Widget 测试。
- 2026-09-11：`flutter analyze` 0 error；`flutter test` **73 通过 / 1 失败**。唯一失败 `test/controllers/recently_controller_test.dart: playSong 应该将歌曲移到最前面` 是**既有失败**（已在 HEAD ba28beb 上复现）：单测无 just_audio 平台实现 → `setPlaylist` 抛异常 → `Get.snackbar` 在无 overlay 的测试环境崩（`SnackbarController._configureOverlay` Null check）。
- 关键约定：**任何用到 GetStorage 的测试文件，path_provider mock 必须返回各自独立的 `Directory.systemTemp.createTemp(...)` 目录**，否则 `flutter test` 并行跑多文件时会争用同一 `.\GetStorage.gs` 文件锁（errno=33）导致偶发失败。
- **`pumpAndSettle()` 遇到无限动画会永不返回**：`RotatingAlbumCover` 内部 `_animController..repeat()`（移动端底栏 `LiquidGlassBottomBar`、播放器等均含它）→ 测试里凡 pump 到它，必须改用定次 `tester.pump(const Duration(...))`。（2026-09-13 实测：用 `pumpAndSettle` 写底栏测试直接挂死 5 分钟。）
- 捕获溢出异常做断言时，`FlutterError.onError` 陷阱要用 `addTearDown` 恢复，并在每个用例开始时清空消息列表；判据是异常文本包含 `overflowed`。

## 酷狗接口约定（2026-09-11 真实接口实测）
- **歌单详情 `/pubsongs/v2/get_other_list_file_nofilt` 的 `global_collection_id` 只接受 gid**（形如 `collection_3_2132029040_287_0`）。
  - 传数字 specialid → `error_code=20010` 且 `data` 为空对象（**不抛异常**，旧代码表现为页面永久转圈）。
  - 传 gcid_xxx（egid）同样无效。所有可用入口（首页/广场/我的/搜索歌单 Tab）都传 gid。
- `AudioService` 索引不变式：`songList[i]` ↔ `playlist[i]` 必须等长。`player.insertAudioSource(i, src)` 是「在 i 处插入」（序列会变长），但只要总插在自身索引 i 处，i 之前的映射不受影响，因此该方案可工作（勿改成 `addAudioSource` 追加到末尾）。
- `_prefetchSong` 会被 `isLoadingIndices` 拦截 → 「立即播放刚入队的歌」前必须先等它结束（`AudioService.addAndPlay` 已内置）。
- 接口签名：web 用 salt `NVPh5oo715z5DIWAeQlhMDsWXXQV4hwt` + appid 1014 + dfid=- 可匿名调 `/v1/search/*`、`/v2/search/song`；app(android) 用 salt `LnT6xpN3khm36zse0QzvmgTZ3waWdRSA`（isLite）+ appid 3116/clientver 11440，`/v6/search/complex` 与 gateway 接口还需设备注册 dfid，否则返回 20006。

## 运行环境（安卓模拟器）
- **Android SDK 位置：`D:/Runtime/Android/Sdk`**（2026-09-13 更正；`ANDROID_HOME` 曾被外部改写成 `D:\Runtime\Android\Android studio\jbr\bin`，那个路径下没有 platform-tools，不可用）。命令用绝对路径调用 `"D:/Runtime/Android/Sdk/platform-tools/adb.exe"`。
- 截至 2026-09-13：无已连接设备，`~/.android/avd/` 为空（原 `Pixel_10` AVD 已不存在），需重建 AVD 才能跑模拟器。
- 启动命令：`"$ANDROID_HOME/emulator/emulator.exe" -avd Pixel_10 -gpu swiftshader -no-audio`（软件渲染，无 GPU 也能跑）。用 `adb wait-for-device` + `getprop sys.boot_completed` 轮询启动。
- 运行：`flutter run -d emulator-5554`（需同时导出 `JAVA_HOME`=Amazon Corretto，Gradle 用 JDK17）。
- 首次安卓构建约 100s，`√ Built ...app-debug.apk` 后安装到 `cn.tia.ku_gou_music`。
- 已知构建告警（非致命）：`audioplayers_android` 的 Kotlin 增量编译缓存因 C:/D: 跨盘根报错（“this and base files have different roots”），但构建仍成功；另有 Kotlin Gradle Plugin 迁移提示（未来版本会失败，建议迁 Built-in Kotlin）。
- 模拟器上 API（歌单/用户详情）同样返回 `error_code 20017/20018/31863` 且触发登录失效——酷狗 API 版权/鉴权限制，非代码 bug。

## 已知坑
- `AudioService` 构造函数依赖 `Get.find<SongCacheService>()`；测试里注册顺序必须是 `SongCacheService → AudioService → MusicController`。
- 模型重构频繁（如 `SearchComplexResponse` 由直接 getter 改为 `lists→SearchComplexGroup→扩展 getter`），改模型后记得同步改测试。
- **M3 主题会污染弹窗底色**：`ColorScheme.fromSeed` 下 M3 `Dialog`/`AlertDialog` 默认背景是 `surfaceContainerHigh`（带主色染色），与设计稿的纯白不符。本项目约定：需要纯白弹窗时必须显式设 `backgroundColor: 深色 ? colorScheme.surface : Colors.white`（`surfaceTintColor: Colors.transparent` 作防御）。
- **GetX `Obx` 必须真正读到 observable**：回调内若存在某条分支完全没读任何 Rx（如个别项走 `SizedBox.shrink()` 早返回），会抛「Improper use of GetX」。写法：在 Obx 顶部无条件 `values[key]` 读一次。

## 设置模块（2026-09-13 新增）
- 三个文件：`lib/models/settings/settings_model.dart`（4 分组 / 每项 defaultValue / 平台可用性）、`lib/controllers/settings_controller.dart`（`GetStorage('app_settings')` 持久化 + 主题派生 + `refreshHints` 重启提示）、`lib/views/settings/settings.dart`（左分组栏 + 卡片网格 + 各类弹窗）。
- 入口：`title_bar.dart` 齿轮按钮 → `navigateTo('/settings')`；路由在 `router/config.dart`。
- 主题联动：`main.dart` 的 `GetMaterialApp` 被 `Obx` 包裹，读取 `values['theme'/'themeColor'/'font']`，`_buildTheme()` 从 controller 派生 ColorScheme → 改主色调即时全局换肤（已实测双向生效）。
- 设计基线是 Vue 版 `MoeKoe-Music-For-Tauri/src/views/Settings.vue`（弹窗纯白、遮罩 rgba(0,0,0,.6)、选项 li 底色 `--background-color`），移植时按项目 PC 页面约定重写而非照搬 CSS。

## Windows 桌面 UI 自动化核验（2026-09-13 建立）
- **首选无侵入通道：Dart VM Service `evaluate`**（`build/vm_eval.js`，Node 22 内置 WebSocket 即可）。
  用法：`node vm_eval.js ws://127.0.0.1:<port>/<token>/ws <库名片段> "<表达式>"`。
  表达式在**指定 library 的作用域**里求值，所以选一个 import 了所需符号的库（如 `sidebar.dart` 里有 `Get` 和 `LocalRouterController`）。
  可做：`Get.find<LocalRouterController>().navigateTo('/discover')`、`Get.find<X>().switchTab(...)`、`spring.activeScrollController.value?.jumpTo(n)`。
  **不要用鼠标点击去抢前台**：沙箱里宿主窗口常占着前台（曾出现前台是全屏游戏），`SetForegroundWindow`/ALT 解锁/`SwitchToThisWindow` 都可能失败；抢不到前台时点击只会激活窗口而不触发控件。
- **`evaluate` 的致命坑**：它会在**帧内中断 isolate** 执行。表达式里**直接写 Rx** 会抛
  `Failed assertion: owner!._debugCurrentBuildTarget != null`（在 build/layout 期 markNeedsBuild），
  并且会**把那个 Obx 的订阅打断** —— 之后向同一 Rx 写入，界面不再更新（控制器里值已变、UI 不动，极易误判成业务 bug）。
  **正确做法**：表达式只做调度，把写入交给事件循环 —— `Future.delayed(const Duration(milliseconds: 500), () => ...)`。
  一旦误触发过断言，**重启应用**才能恢复干净状态。
- **溢出判定用像素扫描纯 `#FFFF00`**（Flutter 溢出条纹就是这个纯黄；黄黑配色的封面图会是 `#E1CA41` 之类的不纯黄，可据此区分）。
  比肉眼看图和查日志可靠：`flutter run > log 2>&1` 的 stdout 是**块缓冲**，运行期日志基本不落盘（`wc -l` 长期停在 20 行左右）。
- 截图/点击工具 `build/click_capture.py`（纯 ctypes，零依赖）：`PrintWindow(hwnd, dc, 2)` 抓窗口（沙箱里 `BitBlt` 抓到全黑）；`AttachThreadInput` 强制前台；支持 `scroll <delta>` 与 `probe "x,y;x,y"`（直接打印真实 RGB）。
- 沙箱内**无法 `Add-Type` 编译 C#**（安全策略拦截）、**无法 `pip install`**（系统代理 127.0.0.1:26501 失效 + 沙箱拦截），所以一切工具都用纯 Python ctypes + zlib 手写 PNG。
- **坐标陷阱**：读图时图片会被缩放显示（1266 宽按 ~1080 显示，系数 ≈0.853），按肉眼估的坐标点击会系统性偏移。
  正解：先用像素扫描求出控件真实 bbox 中心（如开关灰底 `#D9D9D9`、按钮红 `#F44336`、侧栏图标灰 `#A0A0A0`），再点击。本机 DPI 100%，widget 逻辑像素 = 物理像素。
- 窗口尺寸：`DwmGetWindowAttribute(hwnd, 9, EXTENDED_FRAME_BOUNDS)` 取真实矩形（排除阴影）；`MoveWindow` 改尺寸即可切换 PC/移动端外壳（判定条件是 `size.width < size.height`）。

## 导航结构（2026-09-13 改版）
- 侧边栏/底栏现为：**首页 `/home` / 发现 `/discover` / 最近播放 `/recently` / 我的 `/my`**（PC 与移动端均为 4 项，2026-09-13 补齐移动端最近播放）。
  - 「广场」菜单已删除；`/plaza` 路由与 `pc/plaza/` 页面**保留但无入口**。
  - 「排行榜」已改名「发现」，图标 `Icons.explore`，路由 `/ranking` → `/discover`（`pc/ranking/` 目录名未改）。
- 移动端底栏 4 项 + 右侧旋转封面（`index==3` 为「我的」，需登录；`paths = ['/home','/discover','/recently','/my']`）。
- **移动端底栏窄屏收敛**：`LiquidGlassBottomBar` 的每项宽度按 `MediaQuery.sizeOf(context).width` 反推，`clamp(46, 60)`；360px 及以上保持 60/48 原尺寸，仅 320px 级超窄屏才收敛（避免溢出）。
- 移动端外壳 `Scaffold(extendBody: true)` → 页面底部会被 84px 悬浮 TabBar 盖住，滚动内容需要底部避让。
  发现页的避让常量集中在 `pc/ranking/ranking_layout.dart`（`DiscoverLayout`：断点 600、`mobileTabBarHeight` 84、`bottomInset` 104、网格参数）。
  **注意：滚动区之外的元素（如新歌速递的分页器）也要单独避让。**
- 其他页面（首页/最近播放/我的）同样存在底栏遮挡问题，尚未处理。

## 已知坑

## Git / 网络环境（2026-09-10 更新，重要）
- **本沙箱直连 `github.com:443` 不可达**（`Failed to connect ... after ~2s`），SSH 22 与 SSH-over-443（`ssh.github.com`）也均不可达，gitclone.com 镜像返回 504。
- **可用替代通道：`https://gh-proxy.com/https://github.com/`**（`ghproxy.net` 只能撑住 `ls-remote` 这种小请求，`fetch` 会 21s 连接超时）。用法（不改动全局配置）：
  - 拉取：`git -c url."https://gh-proxy.com/https://github.com/".insteadOf="https://github.com/" fetch origin main`
  - 连通性是**间歇性**的，失败就换代理前缀重试几次，通常能成。
  - 若想确认远程真实状态而不依赖 fetch，可用 GitHub MCP 工具 `list_commits` / `get_commit`（走 API，不受 git 通道影响）。
- **代理通道无法完成 push**：Git Credential Manager 只为 `github.com` 存凭据，代理域名会报 `Invalid username or token`。即使从 `git credential fill` 取出 token 拼进代理 URL 也不建议——会把 PAT 明文暴露给第三方代理。**结论：fetch/rebase 走代理，push 留给用户在本机直连执行。**
- **提交前必看**：`android/gradle.properties` 里的 `org.gradle.offline=true` 是本机无网环境专用，**绝不能提交**（联网机器会构建失败）。提交前先 `git stash push android/gradle.properties`，变基完再 `git stash pop`。
- `.workbuddy/` 与 `overview.md` 已加入 `.gitignore`（2026-09-10）。

## 集成测试（integration_test）约定（2026-07-22 新增）
- 文件：`integration_test/app_flow_test.dart` + `integration_test/mock/search_mock_adapter.dart`；`pubspec.yaml` 已加 `integration_test: sdk: flutter`。
- 启动方式：**直接 `tester.pumpWidget(const MyApp())`，不要调用 `main()`**，从而跳过 `JustAudioBackground.init()`（桌面/无通知环境会崩）。但 `MyApp` 的 `MusicBinding` 仍会 lazy 创建 `AudioService`（HomePage 构建时），需真实音频后端 → **集成测试要跑在 Android/iOS 模拟器或真机**。
- 强制 PC 布局：`await tester.binding.setSurfaceSize(const Size(1280, 800))`（`MyApp` 用 `size.width < size.height` 区分移动/桌面）。
- 网络 Mock：`dio.httpClientAdapter = MockHttpClientAdapter()`，仅拦截 `/search/complex` 返回本地 JSON，其余请求透传真实网络。
- 播放控制离线可测：`AudioService._generateSilenceSource` 用 1 秒静音 WAV 的 data URI 占位，预载假 `SongItemStruct` 即可驱动 play/pause/next，不触发真实音频请求。
- 每个用例前用 `Get.reset()` + 重新 `GetStorage.init()/userInstance.init()/SongCacheService.init()` 做隔离。
