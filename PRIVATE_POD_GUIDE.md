# AntMarkdown 私有 CocoaPods 库集成指南

本指南将帮助你设置和使用 AntMarkdown 作为私有 CocoaPods 库。

## 方式一：使用私有 Specs 仓库（推荐）

### 1. 创建私有 Specs 仓库

如果你还没有私有 Specs 仓库，需要先创建一个：

```bash
# 在 Git 服务器（如 GitHub、GitLab）上创建一个新仓库，命名为 specs-repo
# 然后本地初始化
pod repo add YourPrivateSpecs https://github.com/shengjunxiangban/your-private-specs-repo.git
```

### 2. 准备 AntMarkdown 代码仓库

确保你的 AntMarkdown 代码已经推送到 Git 仓库：

```bash
cd /Users/yangxiaolong/Desktop/FluidMarkdown
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/shengjunxiangban/FluidMarkdown.git
git push -u origin main
```

### 3. 打标签

CocoaPods 使用 Git 标签来管理版本：

```bash
git tag 0.1.0
git push origin 0.1.0
```

### 4. 更新 podspec 中的仓库信息

编辑 `AntMarkdown.podspec`，更新以下字段：

```ruby
spec.homepage     = "https://github.com/shengjunxiangban/FluidMarkdown"  # 你的实际仓库地址
spec.source       = { :git => "https://github.com/shengjunxiangban/FluidMarkdown.git", :tag => "#{spec.version}" }
spec.author       = { "Your Name" => "your-email@example.com" }  # 你的信息
```

### 5. 验证 podspec

```bash
pod spec lint AntMarkdown.podspec --allow-warnings
```

### 6. 推送到私有 Specs 仓库

```bash
pod repo push YourPrivateSpecs AntMarkdown.podspec --allow-warnings
```

### 7. 在项目中使用

在你的项目 Podfile 中添加：

```ruby
source 'https://github.com/shengjunxiangban/your-private-specs-repo.git'
source 'https://cdn.cocoapods.org/'

platform :ios, '11.0'

target 'YourApp' do
  pod 'AntMarkdown', '~> 0.1.0'
end
```

然后运行：

```bash
pod install
```

## 方式二：直接使用 Git 仓库（简单快速）

如果不想设置私有 Specs 仓库，可以直接在 Podfile 中指定 Git 地址：

```ruby
platform :ios, '11.0'

target 'YourApp' do
  pod 'AntMarkdown', :git => 'https://github.com/shengjunxiangban/FluidMarkdown.git', :tag => '0.1.0'
end
```

## 方式三：本地路径（开发测试）

在开发阶段，可以直接使用本地路径：

```ruby
platform :ios, '11.0'

target 'YourApp' do
  pod 'AntMarkdown', :path => '../FluidMarkdown'
end
```

## 常见问题

### 1. 找不到头文件

如果遇到头文件找不到的问题，检查 `AntMarkdown.podspec` 中的 `public_header_files` 配置是否正确。

### 2. 资源文件找不到

确保 `resource_bundles` 配置正确，资源文件路径与实际文件结构匹配。

### 3. 编译错误

检查系统框架依赖是否完整，确保所有必要的框架都已添加到 `spec.frameworks` 中。

## 更新版本

当需要发布新版本时：

1. 更新 `AntMarkdown.podspec` 中的 `spec.version`
2. 提交代码并打新标签：
   ```bash
   git tag 0.1.1
   git push origin 0.1.1
   ```
3. 推送到 Specs 仓库：
   ```bash
   pod repo push YourPrivateSpecs AntMarkdown.podspec --allow-warnings
   ```

## 注意事项

- 确保所有依赖的外部库（如 CocoaMarkdown、cmark-gfm 等）都已包含在项目中
- 资源文件路径必须与实际文件结构匹配
- 版本号遵循语义化版本控制（Semantic Versioning）
