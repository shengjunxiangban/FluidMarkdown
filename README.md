# AntMarkdown（CocoaPods）

Fork 自 [antgroup/FluidMarkdown](https://github.com/antgroup/FluidMarkdown)，便于通过 CocoaPods 集成。

## 主工程引用（推荐）

```ruby
pod 'AntMarkdown', :git => 'https://github.com/shengjunxiangban/FluidMarkdown.git', :tag => '0.1.4'
```

## 发布新版本

```bash
# 1. 改 AntMarkdown.podspec 里的 spec.version
# 2. 提交并推送
git add -A
git commit -m "chore: AntMarkdown 0.1.4"
git push origin main
git tag 0.1.4
git push origin 0.1.4
```

## 本地联调（未 push tag 时）

```ruby
pod 'AntMarkdown', :path => '../FluidMarkdown'
```

## 0.1.4 修复

- `preserve_paths` 保留 cmark-gfm 的 `*.inc`（修复 git pod 下 `case_fold_switch.inc` not found）

## 0.1.2 修复

- 去掉 `exclude_files` 中的 `**/*.plist`，保留 `xits-math.plist`（公式/数学变量渲染）
- `MTFont` 适配 CocoaPods 将 `mathFonts.bundle` 扁平合并进 `AntMarkdown.bundle`

## 校验 podspec

```bash
pod spec lint AntMarkdown.podspec --quick --allow-warnings
```
