# GitHub Actions构建指南

## 🚀 使用GitHub Actions构建iOS应用

### 📋 准备工作
- ✅ 代码已推送到GitHub
- ✅ 证书文件已添加到项目
- ✅ GitHub Actions配置已准备

### 🔧 配置步骤

#### 步骤1: 推送代码到GitHub
```bash
# 推送代码到GitHub
git push origin main
```

#### 步骤2: 在GitHub中启用Actions
1. 访问你的GitHub仓库
2. 点击"Actions"标签
3. 点击"Enable Actions for this repository"

#### 步骤3: 手动触发构建
1. 在Actions页面，选择"iOS Build - 聊聊"
2. 点击"Run workflow"
3. 选择分支：`main`
4. 点击"Run workflow"

### 📱 构建过程
GitHub Actions会自动执行以下步骤：
1. **检出代码** - 下载最新代码
2. **设置Xcode** - 安装最新Xcode
3. **安装CocoaPods** - 安装依赖
4. **设置证书** - 导入证书和描述文件
5. **构建IPA** - 使用xcodebuild构建
6. **上传IPA** - 保存构建结果

### 📁 获取IPA文件
构建完成后：
1. 在Actions页面点击构建任务
2. 在"Artifacts"部分下载"聊聊-iOS-App"
3. 解压下载的文件，获得IPA

### ⚠️ 注意事项
1. **构建时间**：通常需要5-10分钟
2. **免费额度**：GitHub Actions每月有2000分钟免费
3. **证书安全**：证书文件已包含在代码中，确保仓库是私有的
4. **设备限制**：IPA只能在描述文件中的设备上安装

### 🆘 常见问题

#### 构建失败
1. 检查证书文件是否正确
2. 检查Bundle ID是否匹配
3. 查看构建日志中的错误信息

#### 签名失败
1. 确保证书密码正确（密码：1）
2. 确保描述文件有效
3. 确保设备UDID在描述文件中

#### 依赖安装失败
1. 检查Podfile是否正确
2. 尝试更新CocoaPods版本

### 📊 构建信息
- **应用名称**：聊聊
- **Bundle ID**：app.article1307.danger1686
- **服务器地址**：203.91.72.43:8090
- **注册方式**：无需短信验证码
- **构建类型**：Ad Hoc分发

### 🎯 下一步
构建成功后，你可以：
1. 下载IPA文件
2. 通过iTunes或其他工具安装到设备
3. 测试应用功能
4. 分发IPA给其他用户（需要设备UDID在描述文件中）

