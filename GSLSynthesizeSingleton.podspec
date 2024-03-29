Pod::Spec.new do |s|
  s.name         = 'GSLSynthesizeSingleton'
  s.version      = '4.0.2'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSLSynthesizeSingleton'
  s.source       = { :git => 'https://github.com/GyazSquare/GSLSynthesizeSingleton.git', :tag => '4.0.2' }
  s.summary      = 'A simple macro for an Objective-C singleton class.'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.source_files = 'GSLSynthesizeSingleton/*.{h,m}'
end
