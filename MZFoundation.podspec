Pod::Spec.new do |s|
  s.name         = "MZFoundation"
  s.version      = "0.0.1"
  s.summary      = "A short description of MZFoundation."

#  s.description  = <<-DESC
#                   A longer description of MZFoundation in Markdown format.
#
#                   * Think: Why did you write this? What is the focus? What does it do?
#                   * CocoaPods will be using this to generate tags, and improve search results.
#                   * Try to keep it short, snappy and to the point.
#                   * Finally, don't worry about the indent, CocoaPods strips it!
#                   DESC

  s.homepage     = "http://EXAMPLE/MZFoundation"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Matzo" => "ksk.matsuo@gmail.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "7.0"
  # s.osx.deployment_target = "10.7"
  s.source       = { :git => "https://github.com/Matzo/MZFoundation.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
#  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
