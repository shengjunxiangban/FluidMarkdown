Pod::Spec.new do |spec|
  spec.name         = "AntMarkdown"
  spec.version      = "0.1.0"
  spec.summary      = "A powerful Markdown rendering library for iOS"
  spec.description  = <<-DESC
    AntMarkdown is a comprehensive Markdown rendering library for iOS that supports
    code highlighting, math formulas, tables, and rich text formatting.
  DESC
  
  spec.homepage     = "https://github.com/shengjunxiangban/FluidMarkdown"
  spec.license      = { :type => "Apache-2.0", :file => "LICENSE" }
  spec.author       = { "FluidMarkdown Authors" => "shengjunxiangban@example.com" }
  
  spec.platform     = :ios, "11.0"
  spec.requires_arc = true
  
  spec.source       = { :git => "https://github.com/shengjunxiangban/FluidMarkdown.git", :tag => "#{spec.version}" }
  
  # Public headers
  spec.public_header_files = [
    "AntMarkdown/Sources/Public/*.h",
    "Sources/**/*.h"
  ]
  
  # Source files
  spec.source_files = [
    "AntMarkdown/Sources/Public/**/*.{h,m}",
    "AntMarkdown/Sources/External/**/*.{h,m,c}",
    "Sources/**/*.{h,m}"
  ]
  
  # Exclude Info.plist files
  spec.exclude_files = [
    "AntMarkdown/Sources/External/**/Info.plist",
    "**/*.plist"
  ]
  
  # Resources
  spec.resource_bundles = {
    "AntMarkdown" => [
      "AntMarkdown/Resources/AntMarkdown.bundle/**/*",
      "AntMarkdown/Resources/highlightjs.bundle/**/*",
      "AntMarkdown/Resources/mathFonts.bundle/**/*"
    ]
  }
  
  # System frameworks
  spec.frameworks = "UIKit", "Foundation", "JavaScriptCore", "CoreText", "CoreGraphics"
  
  # Header search paths for external dependencies
  spec.xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/AntMarkdown/Sources/External/**",
    "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited)"
  }
  
  # Compiler flags for C files (commented out to avoid warnings)
  # spec.compiler_flags = "-Wno-shorten-64-to-32"
end
