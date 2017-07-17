#
# Be sure to run `pod lib lint SmartRate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SmartRate'
  s.version          = '0.1.0'
  s.summary          = 'This pod will help you to realize your complex logic of showing rating alert window.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AppStore rating request.
Show your users rating alert only then they are happy.

This pod will help you to realize your complex logic of showing rating alert window.
You could set any sequence of actions.
                       DESC

  s.homepage         = 'https://github.com/korrolion/SmartRate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'korrolion' => 'korrolion@mail.ru' }
  s.source           = { :git => 'https://github.com/korrolion/smartrate.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SmartRate/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SmartRate' => ['SmartRate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
