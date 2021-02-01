Pod::Spec.new do |s|
  s.name = 'IGListKit'
  s.version = '4.0.0'
  s.summary = 'A data-driven UICollectionView framework.'
  s.homepage = 'https://github.com/Instagram/IGListKit'
  s.documentation_url = 'https://instagram.github.io/IGListKit'
  s.description = 'A data-driven UICollectionView framework for building fast and flexible lists.'

  s.license =  { :type => 'MIT' }
  s.authors = 'Instagram'
  s.social_media_url = 'https://twitter.com/fbOpenSource'
  s.source = {
    :git => 'https://github.com/Instagram/IGListKit.git',
    :tag => s.version.to_s
  }
  s.requires_arc = true
  s.library = 'c++'
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'Static/IGListKit.framework'
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    'CLANG_CXX_LIBRARY' => 'libc++',
  }
end
