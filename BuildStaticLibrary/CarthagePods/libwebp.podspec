Pod::Spec.new do |s|
  s.name             = 'libwebp'
  s.version          = '1.1.0'
  s.summary          = 'Library to encode and decode images in WebP format.'
  s.homepage         = 'https://developers.google.com/speed/webp/'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'BSD' }
  s.source           = { :git => 'https://chromium.googlesource.com/webm/libwebp', :tag => 'v' + s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'Static/libwebp.framework'
end
