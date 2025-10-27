# iOS描述文件配置指南

## 📋 什么是描述文件（Provisioning Profile）

描述文件是iOS应用构建和分发必需的配置文件，它包含：
- 应用标识符（Bundle ID）
- 开发者证书
- 设备UDID（用于Ad Hoc分发）
- 应用权限和能力

## 🔧 获取描述文件的步骤

### 1. 登录Apple Developer
访问 [Apple Developer Portal](https://developer.apple.com/account/)

### 2. 创建App ID
1. 进入 "Certificates, Identifiers & Profiles"
2. 选择 "Identifiers" → "App IDs"
3. 点击 "+" 创建新的App ID
4. 填写信息：
   - **Description**: 聊聊
   - **Bundle ID**: app.article1307.danger1686
   - **Capabilities**: 根据需要选择（Push Notifications, Associated Domains等）

### 3. 创建描述文件
1. 选择 "Profiles" → "Distribution"
2. 点击 "+" 创建新的描述文件
3. 选择 "Ad Hoc" 分发类型
4. 选择刚创建的App ID
5. 选择开发者证书
6. 选择要安装的设备（添加设备UDID）
7. 下载描述文件

### 4. 安装描述文件
1. 双击下载的 `.mobileprovision` 文件
2. 文件会自动安装到Xcode中

## 📱 设备UDID获取方法

### 方法1: 通过iTunes
1. 连接iPhone到Mac
2. 打开iTunes
3. 选择设备，点击序列号
4. 复制UDID

### 方法2: 通过Xcode
1. 连接iPhone到Mac
2. 打开Xcode → Window → Devices and Simulators
3. 选择设备，复制Identifier

### 方法3: 通过设置应用
1. 在iPhone上打开设置 → 通用 → 关于本机
2. 长按"序列号"或"型号"复制UDID

## 🛠️ 项目配置

### 1. 将描述文件添加到项目
```bash
# 将描述文件复制到项目目录
cp ~/Downloads/你的描述文件.mobileprovision TangSengDaoDaoiOS/
```

### 2. 修改构建脚本
在 `build_ios_local.sh` 中添加描述文件路径：
```bash
# 设置描述文件
PROVISIONING_PROFILE="你的描述文件.mobileprovision"
```

### 3. Xcode中配置
1. 打开 `TangSengDaoDaoiOS.xcworkspace`
2. 选择项目 → TangSengDaoDaoiOS target
3. 在 "Signing & Capabilities" 中：
   - 选择 "Manual" 签名
   - 选择对应的描述文件
   - 选择对应的证书

## ⚠️ 重要提醒

1. **Bundle ID必须匹配**: 描述文件中的Bundle ID必须与项目中的一致
2. **证书必须有效**: 确保开发者证书未过期
3. **设备必须注册**: Ad Hoc分发的设备必须在描述文件中注册
4. **权限必须匹配**: 描述文件中的权限必须与Info.plist中的一致

## 🔄 更新描述文件

当需要添加新设备时：
1. 在Apple Developer Portal中添加设备UDID
2. 重新生成描述文件
3. 下载并安装新的描述文件
4. 重新构建应用

## 📞 需要帮助？

如果你需要帮助获取描述文件，可以：
1. 提供你的Apple Developer账号信息
2. 提供要安装的设备UDID
3. 我可以帮你生成描述文件配置
