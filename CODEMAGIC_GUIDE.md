# Codemagic构建指南

## 🚀 使用Codemagic构建iOS应用

### 步骤1: 上传代码到GitHub
```bash
# 将代码推送到你的GitHub仓库
git remote add origin https://github.com/你的用户名/liaoliao-ios.git
git push -u origin main
```

### 步骤2: 在Codemagic中配置
1. 访问 [Codemagic](https://codemagic.io)
2. 连接GitHub账号
3. 选择你的仓库
4. 上传证书文件：
   - 证书文件：`certificates/证书文件.p12`
   - 证书密码：`1`
   - 描述文件：`certificates/描述文件.mobileprovision`

### 步骤3: 自动构建
- Codemagic会自动使用`codemagic.yaml`配置
- 构建完成后下载IPA文件

## 📋 证书信息
- **Bundle ID**: app.article1307.danger1686
- **Team ID**: KYZ9XAJ4DN
- **证书密码**: 1
- **描述文件**: Ad Hoc类型
- **设备UDID**: 00008130-001E4C3A02C3001C

