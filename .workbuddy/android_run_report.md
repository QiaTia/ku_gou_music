# 酷狗音乐 Flutter — 运行到安卓模拟器

## 一、环境前提（已一次性配置，后续免重复）
- **Android SDK 不在默认路径**，实际位于 `D:\runtime`（含 emulator / system-images / platforms / build-tools 全套）。
- 已持久化用户级环境变量：
  - `ANDROID_HOME = D:\runtime`
  - `ANDROID_SDK_ROOT = D:\runtime`
  - `JAVA_HOME = C:\Program Files\HBuilderX\plugins\amazon-corretto`（Gradle 用 JDK17）
- 可用虚拟设备：`Pixel_10`（基于 `android-37.1` 镜像，x86_64）。

## 二、启动模拟器
```bash
export ANDROID_HOME="D:/runtime"
"$ANDROID_HOME/emulator/emulator.exe" -avd Pixel_10 -gpu swiftshader -no-audio
```
- `-gpu swiftshader`：软件渲染，无 GPU 也能跑；`-no-audio` 减少依赖。
- 轮询启动完成：`adb wait-for-device` 后查 `adb shell getprop sys.boot_completed` = `1`（约 40s）。

## 三、运行项目
```bash
export ANDROID_HOME="D:/runtime"
export JAVA_HOME="C:/Program Files/HBuilderX/plugins/amazon-corretto"
flutter run -d emulator-5554
```
- 首次构建约 100s，`√ Built ...app-debug.apk` 后安装到 `cn.tia.ku_gou_music`。
- 应用正常启动：Impeller(OpenGLES)、`zh_Hans` 本地化、歌曲缓存服务初始化成功、首页 48 个歌单加载。

## 四、非致命提示（不影响运行）
1. **Kotlin 增量缓存跨盘报错**：`audioplayers_android` 编译时 `this and base files have different roots (C:\... vs D:\Project\ku_gou_music\android)`，构建仍成功。
2. **Kotlin Gradle Plugin 迁移告警**：Flutter 未来版本需迁 Built-in Kotlin（当前不阻塞）。
3. **API 版权/登录失效**：歌单/用户详情返回 `error_code 20017/20018/31863`，触发登录失效登出流程——酷狗 API 版权/鉴权限制，非代码 bug。

## 五、复跑 / 热重载
模拟器已常驻后台，直接 `flutter run -d emulator-5554` 即可（已安装包会覆盖更新）。
