#
# Be sure to run `pod lib lint xdpoc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'xdpoc'
  s.version          = '0.1.0'
  s.summary          = 'xdpoc'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  generate method&shortcut for classes
                       DESC

  s.homepage         = 'https://github.com/uxinting/xdp-oc'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'uxinting' => 'wu.xinting@hotmail.com' }
  s.source           = { :git => 'https://github.com/uxinting/xdp-oc.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'xdpoc/Classes/**/*'
  
  # s.resource_bundles = {
  #   'xdpoc' => ['xdpoc/Assets/*.png']
  # }

  s.public_header_files = 'xdpoc/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
