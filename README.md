# Ring Native SDK

`uts-ring-sdk` 使用的智能戒指厂商原生 SDK 云端依赖仓库，同时提供 Android Maven 和 iOS CocoaPods 接入方式。

## 版本

- Android JitPack 聚合版本：`v1.0.3`
- iOS CocoaPods 聚合版本：`v1.0.3`
- Android 最低版本：API 26
- iOS 最低版本：iOS 12.0
- iOS `DHBleSDK`：`1.1.8`

## Android

通过 JitPack 引入：

```groovy
maven {
    url "https://jitpack.io"
    content {
        includeGroupByRegex "com\\.github\\.ChenZhenChun.*"
    }
}
```

```groovy
implementation "com.github.ChenZhenChun:ring-native-sdk:v1.0.3"
```

聚合制品包含 `android/blesdk.aar`，其 POM 同时声明 UTS 插件原有的 AndroidX、EventBus、Material、XXPermissions 和 FileSelector 依赖。

## iOS

Podspec 名称为 `OSRingSDK`，可直接固定 GitHub Tag 引入：

```ruby
pod 'OSRingSDK', :git => 'https://github.com/ChenZhenChun/ring-native-sdk.git', :tag => 'v1.0.3'
```

Pod 包含 `DHBleSDK.framework`、`DHFoundation.framework` 和 `DHUIKit.framework`。厂商二进制不包含模拟器架构，必须使用 iPhone 真机验证。

## 发布新版本

以下示例将版本升级到 `1.0.3`：

1. 替换 `android/blesdk.aar` 和/或 `ios/Frameworks` 中的厂商二进制。
2. 更新 `build.gradle` 的默认版本以及 `OSRingSDK.podspec` 的 `s.version`。
3. 本地验证 Android Maven 发布结构：

   ```bash
   VERSION=1.0.3 ./gradlew clean publishToMavenLocal --no-daemon
   ```

4. 提交并创建不可变标签：

   ```bash
   git add .
   git commit -m "更新戒指原生 SDK 至 1.0.3"
   git push origin master
   git tag v1.0.3
   git push origin v1.0.3
   ```

5. 在 JitPack 检查 `com.github.ChenZhenChun:ring-native-sdk:v1.0.3` 构建成功，再同步更新 `uts-ring-sdk` 两端的依赖 tag/版本。该仓库的 JitPack Maven 版本保留 Git Tag 的 `v` 前缀。

已发布标签不得删除后重建；需要修正时发布新版本，确保历史构建可重复。
