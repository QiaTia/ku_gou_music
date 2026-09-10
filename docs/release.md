# 构建与发布

本文档说明 CI/CD 发布流程（`.github/workflows/release.yml`）与本地构建方式。

## CI/CD 自动发布

### 触发方式

推送 `v*` 格式的 tag（建议语义化版本，如 `v1.0.0`）：

```bash
git tag v1.0.0
git push origin v1.0.0
```

也支持在 GitHub Actions 页面手动触发（`workflow_dispatch`），用于调试 workflow 本身。

### 构建矩阵

| 平台 | 架构 | Runner | 产物 |
| --- | --- | --- | --- |
| Android | arm64-v8a / armeabi-v7a / x86_64 | ubuntu-latest | `kugou-music-android-{abi}.apk`（split-per-ABI）+ `kugou-music-android.aab` |
| iOS | arm64 | macos-latest | `kugou-music-ios-arm64.zip`（**未签名** .app） |
| macOS | arm64 / x64 | macos-latest | `kugou-music-macos-{arch}.zip`（ad-hoc 签名） |
| Windows | x64 / arm64 | windows-latest | `kugou-music-windows-{arch}.zip` |
| Linux | x64 / arm64 | ubuntu-latest | `kugou-music-linux-{arch}.zip` |

所有产物汇总后由 `release` job 通过 `softprops/action-gh-release` 发布到对应 tag 的 GitHub Release，并自动生成 Release Notes。

每个 job 的固定流程：checkout → Flutter 3.44.1（stable，缓存）→ `flutter pub get` → `build_runner` 代码生成 → 构建 → 打包重命名 → 上传 artifact（保留 30 天）。

### Android 签名（可选）

在仓库 **Settings → Secrets and variables → Actions** 配置以下 secrets 后，workflow 自动解码 keystore 并用其签名；未配置时回退 debug 签名：

| Secret | 说明 |
| --- | --- |
| `ANDROID_KEYSTORE_BASE64` | keystore 文件的 base64 编码（`base64 -w0 upload-keystore.jks`） |
| `ANDROID_KEY_ALIAS` | key 别名 |
| `ANDROID_KEY_PASSWORD` | key 密码 |
| `ANDROID_STORE_PASSWORD` | keystore 密码 |

### 注意事项

- **iOS / macOS 必须在 macOS runner 上构建**（GitHub 免费额度可用，但 macOS 分钟数按 10 倍计费）
- 本流程不配置 Apple 证书：iOS 产物为**未签名**的 `Runner.app`，macOS 为 **ad-hoc 签名**。如需分发给他人，需自行配置证书 / 描述文件后重签
- Linux arm64 与 Windows arm64 依赖交叉编译（workflow 已安装对应工具链）
- tag 发布不启用并发取消（`cancel-in-progress: false`），确保产物完整

## 本地构建

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

flutter build apk --release --split-per-abi   # Android 按 ABI 拆分（同 CI）
flutter build appbundle --release             # Android AAB
flutter build ios --release                   # iOS（需 macOS + Xcode）
flutter build macos --release                 # macOS
flutter build windows --release               # Windows
flutter build linux --release                 # Linux
```

各平台产物位置：

| 平台 | 路径 |
| --- | --- |
| Android APK | `build/app/outputs/flutter-apk/` |
| Android AAB | `build/app/outputs/bundle/release/` |
| Windows | `build/windows/x64/runner/Release/` |
| Linux | `build/linux/x64/release/bundle/` |
| macOS | `build/macos/Build/Products/Release/*.app` |
| iOS | `build/ios/iphoneos/Runner.app` |

## 应用图标

项目集成 `icons_launcher`（pubspec 已声明），可用配置文件重新生成各平台应用图标。
