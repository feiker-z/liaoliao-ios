# 🚀 GitHub Actions构建完整指南

## 📋 当前状态
- ✅ 代码已准备完成
- ✅ GitHub Actions配置已优化
- ✅ 证书文件已添加
- ✅ 应用名称：聊聊
- ✅ 服务器地址：203.91.72.43:8090

## 🔧 操作步骤

### 步骤1: 推送代码到GitHub
由于服务器无法直接推送到GitHub，你需要：

1. **下载项目文件**：
   ```bash
   # 在服务器上打包项目
   cd /root
   tar -czf TangSengDaoDaoiOS.tar.gz TangSengDaoDaoiOS/
   ```

2. **上传到GitHub**：
   - 下载`TangSengDaoDaoiOS.tar.gz`文件
   - 解压到本地
   - 推送到你的GitHub仓库

### 步骤2: 在GitHub中启用Actions
1. 访问你的GitHub仓库
2. 点击"Actions"标签
3. 点击"Enable Actions for this repository"

### 步骤3: 手动触发构建
1. 在Actions页面，选择"iOS Build - 聊聊"
2. 点击"Run workflow"
3. 选择分支：`main`
4. 点击"Run workflow"

## 📱 构建配置详情

### 证书信息
- **证书文件**：`certificates/证书文件.p12`
- **证书密码**：`1`
- **描述文件**：`certificates/描述文件.mobileprovision`
- **Bundle ID**：`app.article1307.danger1686`
- **Team ID**：`KYZ9XAJ4DN`

### 构建参数
- **Xcode版本**：最新稳定版
- **构建配置**：Release
- **签名方式**：Manual
- **分发类型**：Ad Hoc

## 🎯 预期结果
构建成功后，你将获得：
- **IPA文件**：`聊聊-iOS-App.ipa`
- **应用名称**：聊聊
- **功能**：完整的IM聊天功能
- **注册**：无需短信验证码

## ⚠️ 重要提醒
1. **仓库权限**：建议使用私有仓库保护证书文件
2. **设备限制**：IPA只能在描述文件中的设备上安装
3. **构建时间**：通常需要5-10分钟
4. **免费额度**：GitHub Actions每月有2000分钟免费

## 🆘 如果遇到问题
1. **构建失败**：查看Actions日志中的错误信息
2. **签名失败**：检查证书文件和密码
3. **依赖问题**：检查Podfile配置

## 📞 需要帮助？
如果遇到问题，请提供：
1. GitHub Actions的构建日志
2. 具体的错误信息
3. 构建失败的步骤

