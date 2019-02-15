Pod::Spec.new do |spec|
  spec.name         = "UIKitCategory"
  spec.version      = "1.0.1"
  spec.summary      = "iOS UIKit Category."

  spec.description  = <<-DESC
                        iOS UIKit Category. Such as UIColor, UIView, CALayer.
                   DESC

  spec.homepage     = "https://github.com/kidyoungx/UIKitCategory"

  spec.license      = "MPL-2.0"

  spec.author             = { "Kid Young" => "kidyoungx@gmail.com" }

  spec.platform     = :ios, "5.0"

  spec.source       = { :git => "https://github.com/kidyoungx/UIKitCategory.git", :tag => "#{spec.version}" }

  spec.source_files  = "UIKitCategory", "UIKitCategory/**/*.{h,m}"
  spec.exclude_files = "SampleUIKitCategory"

  spec.public_header_files = "UIKitCategory/**/*.h"

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
