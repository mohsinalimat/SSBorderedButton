Pod::Spec.new do |s|
  s.name         = "SSBorderedButton"
  s.version      = "0.0.1"
  s.summary      = "A simple bordered UIButton."
  s.homepage     = "http://github.com/StyleShare/SSBorderedButton"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "devxoul" => "devxoul@gmail.com" }
  s.source       = { :git => "https://github.com/StyleShare/SSBorderedButton.git" }
  s.platform     = :ios, '7.0'
  s.source_files = 'SSBorderedButton/*.{h,m}'
  s.frameworks   = 'UIKit', 'Foundation', 'QuartzCore'
  s.requires_arc = true

  s.dependency 'UIImage+BetterAdditions', '~> 2.0'
end
