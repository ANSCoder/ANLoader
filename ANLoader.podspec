

Pod::Spec.new do |s|
s.name             = 'ANLoader'
s.version          = '1.1.2.1'
s.summary          = 'ANLoader view helps for creating loading view in just a single lines of code.'


s.description      = <<-DESC
ANLoader is a simple to use Loading-Library
This fantastic Loading view easy to create simply in a single line.
DESC
s.homepage         = 'https://github.com/anscoder/ANLoader'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'anscoder' => 'nimjea@gmail.com' }
s.source           = { :git => 'https://github.com/anscoder/ANLoader.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/anand8402'

s.ios.deployment_target = '9.0'
s.source_files = 'ANLoader/Classes/**/*'
s.frameworks = 'UIKit'

end
