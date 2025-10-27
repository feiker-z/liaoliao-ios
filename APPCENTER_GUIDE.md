# AppCenter构建指南

## 🚀 使用AppCenter构建iOS应用

### 为什么选择AppCenter？
- ✅ 专门为移动应用设计
- ✅ 支持自动签名
- ✅ 免费额度充足（每月240分钟）
- ✅ 配置简单
- ✅ 微软支持，稳定可靠

### 步骤1: 注册AppCenter
1. 访问 [AppCenter](https://appcenter.ms)
2. 使用GitHub账号登录
3. 创建新应用

### 步骤2: 配置iOS应用
1. 选择iOS平台
2. 连接GitHub仓库
3. 选择`TangSengDaoDaoiOS`项目

### 步骤3: 配置构建
1. 进入"Build"标签
2. 点击"Configure build"
3. 选择分支：`main`
4. 选择构建配置：`Release`

### 步骤4: 配置签名
1. 在"Signing"部分
2. 选择"Manual signing"
3. 上传证书文件：
   - 证书文件：`certificates/证书文件.p12`
   - 证书密码：`1`
   - 描述文件：`certificates/描述文件.mobileprovision`

### 步骤5: 开始构建
1. 点击"Save & Build"
2. 等待构建完成
3. 下载IPA文件

## 📋 证书信息
- **证书文件**：certificates/证书文件.p12
- **证书密码**：1
- **描述文件**：certificates/描述文件.mobileprovision
- **Bundle ID**：app.article1307.danger1686
- **Team ID**：KYZ9XAJ4DN

## ⚠️ 注意事项
1. 确保Bundle ID与描述文件匹配
2. 确保设备UDID在描述文件中
3. 构建可能需要几分钟时间

## 🆘 如果失败
1. 检查证书文件是否正确
2. 检查Bundle ID是否匹配
3. 检查描述文件是否有效
4. 查看构建日志中的错误信息
