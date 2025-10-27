#!/bin/bash

echo "🚀 开始一键构建iOS应用..."

# 检查是否在macOS上
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ 错误：此脚本只能在macOS上运行"
    exit 1
fi

# 检查Xcode是否安装
if ! command -v xcodebuild &> /dev/null; then
    echo "❌ 错误：请先安装Xcode"
    exit 1
fi

# 进入项目目录
cd "$(dirname "$0")"

echo "📱 项目目录：$(pwd)"

# 安装CocoaPods依赖
echo "📦 安装CocoaPods依赖..."
pod install

# 清理有问题的文件
echo "🧹 清理有问题的文件..."
find . -name "BUILD" -type f -delete 2>/dev/null || true
find . -name "libopencore-amrnb.a" -delete 2>/dev/null || true
find . -name "libopencore-amrwb.a" -delete 2>/dev/null || true
find . -name "libvo-amrwbenc.a" -delete 2>/dev/null || true
rm -rf NotificationContent NotificationService 2>/dev/null || true

# 更新Bundle ID
echo "🔄 更新Bundle ID..."
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier app.article1307.danger1686" "TangSengDaoDao/Info.plist"
find . -name "*.plist" -exec sed -i '' 's/com\.xinbida\.tangsengdaodao/app.article1307.danger1686/g' {} \;
# 使用LC_ALL=C修复编码问题
LC_ALL=C sed -i '' 's/com\.xinbida\.tangsengdaodao/app.article1307.danger1686/g' TangSengDaoDaoiOS.xcodeproj/project.pbxproj

# 创建构建目录
mkdir -p build/ios/xcarchive build/ios/ipa

echo "🔨 开始构建..."
# 先检查可用的目标
echo "📱 检查可用的构建目标..."
xcodebuild -workspace TangSengDaoDaoiOS.xcworkspace -scheme WuKongChatiOS -showdestinations

echo "🔨 开始构建..."
# 使用更简单的方法，不指定OS版本
xcodebuild -workspace TangSengDaoDaoiOS.xcworkspace \
  -scheme WuKongChatiOS \
  -config Release \
  -destination "generic/platform=iOS" \
  -archivePath build/ios/xcarchive/TangSengDaoDaoiOS.xcarchive \
  archive COMPILER_INDEX_STORE_ENABLE=NO \
  -allowProvisioningUpdates \
  CODE_SIGN_STYLE=Automatic \
  IPHONEOS_DEPLOYMENT_TARGET=12.0

if [ $? -eq 0 ]; then
    echo "✅ 构建成功！"
    
    # 创建导出选项
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
    
    echo "📦 导出IPA..."
    xcodebuild -exportArchive \
      -archivePath build/ios/xcarchive/TangSengDaoDaoiOS.xcarchive \
      -exportPath build/ios/ipa \
      -exportOptionsPlist export_options.plist \
      -allowProvisioningUpdates
    
    if [ $? -eq 0 ]; then
        echo "🎉 IPA构建完成！"
        echo "📱 IPA文件位置：$(pwd)/build/ios/ipa/"
        ls -la build/ios/ipa/
        echo ""
        echo "✅ 构建成功！请检查 build/ios/ipa/ 目录"
    else
        echo "❌ IPA导出失败"
        exit 1
    fi
else
    echo "❌ 构建失败"
    exit 1
fi
