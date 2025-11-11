#
# Be sure to run `pod lib lint UserDefaultsWrapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UserDefaultsWrapper'
  s.version          = '1.0.0'
  s.summary          = '💾 A UserDefaults wrapper providing a clean and intuitive interface.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  💾 A UserDefaults wrapper providing a clean and intuitive interface.
                       DESC

  s.homepage         = 'https://github.com/rlarjsdn3/UserDefaultsWrapper-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rlarjsdn3' => 'rlarjsdn3@naver.com' }
  s.source           = { :git => 'https://github.com/rlarjsdn3/UserDefaultsWrapper-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'

  s.source_files = 'Sources/**/*'
  
  # s.resource_bundles = {
  #   'UserDefaultsWrapper' => ['UserDefaultsWrapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
