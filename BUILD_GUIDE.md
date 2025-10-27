# iOS应用本地构建指南

## 📱 应用信息
- **应用名称**: 聊聊
- **服务器地址**: 203.91.72.43:8090
- **注册方式**: 无需短信验证码（使用固定验证码123456）

## 🛠️ 构建要求
- macOS系统
- Xcode（最新版本）
- CocoaPods

## 🚀 快速构建

### 方法1: 使用构建脚本（推荐）
```bash
# 在Mac上运行
cd TangSengDaoDaoiOS
./build_ios_local.sh
```

### 方法2: 手动构建
```bash
# 1. 安装依赖
pod install

# 2. 设置Bundle ID
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier app.article1307.danger1686" "TangSengDaoDao/Info.plist"

# 3. 清理构建
xcodebuild clean -workspace TangSengDaoDaoiOS.xcworkspace -scheme WuKongChatiOS

# 4. 创建存档
xcodebuild -workspace TangSengDaoDaoiOS.xcworkspace \
  -scheme WuKongChatiOS \
  -config Release \
  -archivePath build/ios/xcarchive/TangSengDaoDaoiOS.xcarchive \
  archive COMPILER_INDEX_STORE_ENABLE=NO \
  -allowProvisioningUpdates \
  CODE_SIGN_STYLE=Automatic

# 5. 导出IPA
xcodebuild -exportArchive \
  -archivePath build/ios/xcarchive/TangSengDaoDaoiOS.xcarchive \
  -exportPath build/ios/ipa \
  -exportOptionsPlist export_options.plist \
  -allowProvisioningUpdates
```

## 📁 输出文件
构建成功后，IPA文件将位于：
```
build/ios/ipa/TangSengDaoDaoiOS.ipa
```

## 🔧 配置说明
- **Bundle ID**: app.article1307.danger1686
- **签名方式**: 自动签名
- **分发类型**: ad-hoc
- **服务器**: HTTP (非HTTPS)

## ⚠️ 注意事项
1. 确保Mac上已安装Xcode
2. 确保Apple Developer账号已登录
3. 确保Bundle ID在开发者账号中已注册
4. 构建过程中可能需要输入Apple ID密码

## 🆘 常见问题
- **签名失败**: 检查Apple Developer账号和Bundle ID
- **依赖安装失败**: 尝试 `pod repo update` 然后重新 `pod install`
- **构建失败**: 检查Xcode版本和iOS部署目标

