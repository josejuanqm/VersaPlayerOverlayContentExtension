#
# Be sure to run `pod lib lint VersaPlayerOverlayContentExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VersaPlayerOverlayContentExtension'
  s.version          = '0.1.3'
  s.summary          = 'VersaPlayer extension to enable overlay content.'
  s.description      = 'VersaPlayer extension to enable overlay content functionality.'
  s.homepage         = 'https://github.com/josejuanqm/VersaPlayerOverlayContentExtension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jose Quintero' => 'jose.juan.qm@gmail.com' }
  s.source           = { :git => 'https://github.com/josejuanqm/VersaPlayerOverlayContentExtension.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/josejuanqm'
  s.ios.deployment_target = '9.0'
  s.source_files = 'VersaPlayerOverlayContentExtension/Classes/**/*'
  s.dependency 'VersaPlayer'
  s.swift_version = '4'
end
