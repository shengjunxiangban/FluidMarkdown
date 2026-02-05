# AntMarkdown

一个强大的 iOS Markdown 渲染库，支持代码高亮、数学公式、表格和富文本格式化。

## 功能特性

- ✅ 完整的 Markdown 语法支持
- ✅ 代码高亮（支持多种编程语言）
- ✅ 数学公式渲染（LaTeX）
- ✅ 表格支持
- ✅ 自定义样式
- ✅ 富文本格式化

## 安装

### CocoaPods

#### 私有库集成

1. 将仓库添加到你的 Podfile：

```ruby
source 'https://github.com/shengjunxiangban/your-private-specs-repo.git'  # 你的私有 Specs 仓库
source 'https://cdn.cocoapods.org/'  # CocoaPods 官方源

platform :ios, '11.0'

target 'YourApp' do
  pod 'AntMarkdown'
end
```

2. 运行安装命令：

```bash
pod install
```

#### 本地集成（开发测试）

如果你想在本地测试，可以直接在 Podfile 中指定路径：

```ruby
platform :ios, '11.0'

target 'YourApp' do
  pod 'AntMarkdown', :path => '../FluidMarkdown'
end
```

#### Git 集成

如果库托管在 Git 仓库中：

```ruby
platform :ios, '11.0'

target 'YourApp' do
  pod 'AntMarkdown', :git => 'https://github.com/shengjunxiangban/FluidMarkdown.git', :tag => '0.1.0'
end
```

## 使用方法

### 基本使用

```objc
#import <AntMarkdown/AntMarkdown.h>

// 在 UILabel 中使用
NSString *markdown = @"# Hello World\n\nThis is **bold** text.";
[label setMarkdownText:markdown];

// 在 UITextView 中使用
[textView setMarkdownText:markdown];
```

### 自定义样式

```objc
AMTextStyles *styles = [[AMTextStyles alloc] init];
// 配置样式...
```

## 系统要求

- iOS 11.0 或更高版本
- Xcode 12.0 或更高版本

## 许可证

Apache License 2.0 - 详见 [LICENSE](LICENSE) 文件

## 作者

FluidMarkdown Authors

## 贡献

欢迎提交 Issue 和 Pull Request！
