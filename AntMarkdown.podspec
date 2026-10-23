Pod::Spec.new do |spec|
  spec.name = 'AntMarkdown'
  spec.version = '0.1.3'
  spec.summary = 'iOS Markdown rendering (FluidMarkdown / Ant fork)'
  spec.description = <<-DESC
    Markdown rendering with code highlighting, math, tables, and streaming AMXMarkdownTextView.
    Derived from antgroup/FluidMarkdown; packaged for CocoaPods.
  DESC

  spec.homepage = 'https://github.com/shengjunxiangban/FluidMarkdown'
  spec.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  spec.author = { 'FluidMarkdown Authors' => 'shengjunxiangban@example.com' }

  spec.platform = :ios, '11.0'
  spec.requires_arc = true

  spec.source = { :git => 'https://github.com/shengjunxiangban/FluidMarkdown.git', :tag => spec.version.to_s }

  # Public headers must include CocoaMarkdown: AMTextStyles.h (Public) imports "CocoaMarkdown.h",
  # otherwise Swift explicit modules fail with 'CocoaMarkdown.h' file not found.
  spec.public_header_files = [
    'AntMarkdown/Sources/Public/*.h',
    'AntMarkdown/Sources/External/CocoaMarkdown/**/*.h',
    'AntMarkdown/Sources/External/cmark-gfm/*.h',
    'AntMarkdown/Sources/External/cmark-gfm/src/*.h',
    'AntMarkdown/Sources/External/cmark-gfm/extensions/**/*.h',
    'Sources/**/*.h',
  ]

  spec.source_files = [
    'AntMarkdown/Sources/Public/**/*.{h,m}',
    'AntMarkdown/Sources/External/**/*.{h,m,c}',
    'Sources/**/*.{h,m}'
  ]

  # cmark-gfm 的 .inc 不在 source_files 后缀里；不 preserve 时 CocoaPods 安装会丢掉，
  # 编译 utf8.c 报 case_fold_switch.inc / entities.inc file not found。
  spec.preserve_paths = [
    'AntMarkdown/Sources/External/cmark-gfm/src/*.inc',
  ]

  # 勿用 '**/*.plist'：会把 mathFonts.bundle 里的 xits-math.plist 一并排除，
  # 导致 :git 安装后公式/数学变量（含数字）渲染失败。
  spec.exclude_files = [
    'AntMarkdown/Sources/External/**/Info.plist',
    'AntMarkdown/Sources/**/*.plist',
  ]

  # highlightjs / mathFonts 内容会合并进 AntMarkdown.bundle（扁平）。
  # AMCodeHighlighter / MTFont 需按扁平 bundle 加载资源。
  spec.resource_bundles = {
    'AntMarkdown' => [
      'AntMarkdown/Resources/AntMarkdown.bundle/**/*',
      'AntMarkdown/Resources/highlightjs.bundle/**/*',
      'AntMarkdown/Resources/mathFonts.bundle/**/*'
    ]
  }

  spec.frameworks = 'UIKit', 'Foundation', 'JavaScriptCore', 'CoreText', 'CoreGraphics'

  fluid_cmark_paths = [
    '"$(PODS_TARGET_SRCROOT)/AntMarkdown/Sources/External"',
    '"$(PODS_TARGET_SRCROOT)/AntMarkdown/Sources/External/CocoaMarkdown"',
    '"$(PODS_TARGET_SRCROOT)/AntMarkdown/Sources/External/cmark-gfm"',
    '"$(PODS_TARGET_SRCROOT)/AntMarkdown/Sources/External/cmark-gfm/src"',
    '"$(PODS_TARGET_SRCROOT)/AntMarkdown/Sources/External/cmark-gfm/extensions/core-extensions"',
    '"$(PODS_TARGET_SRCROOT)/AntMarkdown/Sources/External/cmark-gfm/extensions/table"',
  ].join(' ')

  spec.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => "$(inherited) #{fluid_cmark_paths}",
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited)',
  }
end
