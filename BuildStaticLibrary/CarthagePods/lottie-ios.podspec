Pod::Spec.new do |s|
  s.name             = 'lottie-ios'
  s.version          = '3.1.8'
  s.summary          = 'A library to render native animations from bodymovin json. Now in Swift!'
  s.description = <<-DESC
Lottie is a mobile library for Android and iOS that parses Adobe After Effects animations exported as json with bodymovin and renders the vector animations natively on mobile and through React Native!
For the first time, designers can create and ship beautiful animations without an engineer painstakingly recreating it be hand. Since the animation is backed by JSON they are extremely small in size but can be large in complexity! Animations can be played, resized, looped, sped up, slowed down, and even interactively scrubbed.
  DESC
  s.homepage         = 'https://github.com/airbnb/lottie-ios'
  s.license          = { :type => 'Apache' }
  s.author           = { 'Brandon Withrow' => 'buba447@gmail.com' }
  s.source           = { :git => 'https://github.com/airbnb/lottie-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'Static/Lottie.framework'
  end