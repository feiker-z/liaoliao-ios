#!/bin/bash

# iOS本地构建脚本
# 在Mac上运行此脚本

set -e

echo "🚀 开始构建iOS应用..."

# 检查是否在Mac上
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ 此脚本只能在macOS上运行"
    exit 1
fi

# 检查描述文件
echo "🔍 检查描述文件..."
PROVISIONING_PROFILE=$(find . -name "*.mobileprovision" | head -1)
if [ -z "$PROVISIONING_PROFILE" ]; then
    echo "❌ 未找到描述文件(.mobileprovision)"
    echo "📋 请参考 PROVISIONING_GUIDE.md 获取描述文件"
    echo "💡 或者使用Codemagic在线构建（无需本地描述文件）"
    exit 1
fi
echo "✅ 找到描述文件: $PROVISIONING_PROFILE"

# 进入项目目录
cd "$(dirname "$0")"

echo "📱 项目信息："
echo "  应用名称: 聊聊"
echo "  服务器地址: 203.91.72.43:8090"
echo "  无短信验证码: 是"

# 检查CocoaPods
if ! command -v pod &> /dev/null; then
    echo "📦 安装CocoaPods..."
    sudo gem install cocoapods
fi

# 安装依赖
echo "📦 安装CocoaPods依赖..."
pod install

# 设置Bundle ID
BUNDLE_ID="app.article1307.danger1686"
echo "🔧 设置Bundle ID: $BUNDLE_ID"
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier $BUNDLE_ID" "TangSengDaoDao/Info.plist"

# 创建构建目录
mkdir -p build/ios/xcarchive build/ios/ipa

# 清理构建
echo "🧹 清理构建..."
xcodebuild clean -workspace TangSengDaoDaoiOS.xcworkspace -scheme WuKongChatiOS

# 创建存档
echo "📦 创建存档..."
xcodebuild -workspace TangSengDaoDaoiOS.xcworkspace \
  -scheme WuKongChatiOS \
  -config Release \
  -archivePath build/ios/xcarchive/TangSengDaoDaoiOS.xcarchive \
  archive COMPILER_INDEX_STORE_ENABLE=NO \
  -allowProvisioningUpdates \
  CODE_SIGN_STYLE=Automatic

# 检查存档是否创建成功
if [ ! -d "build/ios/xcarchive/TangSengDaoDaoiOS.xcarchive" ]; then
    echo "❌ 存档创建失败！"
    exit 1
fi

echo "✅ 存档创建成功！"

# 创建导出选项
echo "📋 创建导出选项..."
cat > export_options.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>ad-hoc</string>
    <key>compileBitcode</key>
    <false/>
</dict>
</plist>
EOF

# 导出IPA
echo "📱 导出IPA..."
xcodebuild -exportArchive \
  -archivePath build/ios/xcarchive/TangSengDaoDaoiOS.xcarchive \
  -exportPath build/ios/ipa \
  -exportOptionsPlist export_options.plist \
  -allowProvisioningUpdates

# 检查IPA是否创建成功
if [ -f "build/ios/ipa/TangSengDaoDaoiOS.ipa" ]; then
    echo "🎉 IPA构建成功！"
    echo "📁 IPA文件位置: build/ios/ipa/TangSengDaoDaoiOS.ipa"
    echo "📊 文件大小: $(ls -lh build/ios/ipa/TangSengDaoDaoiOS.ipa | awk '{print $5}')"
else
    echo "❌ IPA创建失败！"
    exit 1
fi

echo "✨ 构建完成！"