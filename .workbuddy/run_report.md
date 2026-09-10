# ku_gou_music 运行记录

## 运行目标
- 平台：Windows 桌面（windows-x64）
- 命令：`flutter run -d windows`

## 构建结果
- 状态：✅ 构建成功（增量构建约 10s）
- 产物：`build\windows\x64\runner\Debug\ku_gou_music.exe`
- 应用初始化：歌曲缓存服务 OK，首页歌单数据已加载

## 为使其运行所做的修复
1. **JDK 依赖**：Windows 桌面构建时 jni 插件需要 JDK 的 jni.h。已将用户级 `JAVA_HOME` 持久化指向 Amazon Corretto JDK 17。
2. **CMake 修复**：在 `windows/CMakeLists.txt` 增加全局 include JDK `include` 与 `include/win32` 目录。
3. **ListTile 告警修复（2026-08-26）**：`ListTile` 被带背景的 `DecoratedBox` 包裹的非致命告警已消除。
   - `lib/views/home/pc/layout/sidebar.dart`：外层 `Container` 改为 `Material`（保留圆角背景，splash 可见）。
   - `lib/views/playlist/playlist.dart`：歌单操作弹窗的 `_buildOptionTile` 的 `ListTile` 外包 `Material(color: transparent)`。

## 运行时注意（非致命 / 环境相关）
- ⚠️ `home.dart:297` 的 Column 在窗口较矮时有 RenderFlex 底部溢出 ~1.5px（UI 小瑕疵，待修）。
- just_audio_windows 的 "channel message on non-platform thread" 警告：插件已知问题，非致命。
- 部分歌曲播放 URL / 歌单 / 用户详情获取失败（error_code 20018/31863）：酷狗 API 版权/鉴权或网络环境问题，非代码 bug。

## 复跑方式
确保 `JAVA_HOME` 已设置（已持久化），直接执行：
`flutter run -d windows`
