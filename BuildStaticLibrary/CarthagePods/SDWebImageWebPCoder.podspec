Pod::Spec.new do |s|
    s.name             = 'SDWebImageWebPCoder'
    s.version          = '0.8.1'
    s.summary          = 'WebP decoder/encoder for SDWebImage coder plugin.'

    s.description      = <<-DESC
This is a SDWebImage coder plugin to support WebP image.
                       DESC

    s.homepage         = 'https://github.com/SDWebImage/SDWebImageWebPCoder'
    s.license          = { :type => 'MIT' }
    s.author           = { 'Bogdan Poplauschi' => 'bpoplauschi@gmail.com' }
    s.source           = { :git => 'https://github.com/SDWebImage/SDWebImageWebPCoder.git', :tag => s.version.to_s }

    s.ios.deployment_target = '9.0'
    s.vendored_frameworks = 'Static/SDWebImageWebPCoder.framework'
  end
