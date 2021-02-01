Pod::Spec.new do |s|
  s.name = 'IGListDiffKit'
  s.version = '4.0.0'
  s.summary = 'Diffing utilities for a data-driven UICollectionView framework.'
  s.homepage = 'https://github.com/Instagram/IGListKit'
  s.documentation_url = 'https://instagram.github.io/IGListKit'
  s.description = 'Diffing utilities for a data-driven UICollectionView framework for building fast and flexible lists.'

  s.license =  { :type => 'MIT' }
  s.authors = 'Instagram'
  s.social_media_url = 'https://twitter.com/fbOpenSource'
  s.source = {
    :git => 'https://github.com/Instagram/IGListKit.git',
    :tag => s.version.to_s,
    :branch => 'stable'
  }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.library = 'c++'
  s.pod_target_xcconfig = {
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
        'CLANG_CXX_LIBRARY' => 'libc++',
  }
  s.xcconfig = { 'OTHER_LDFLAGS' => '-fprofile-instr-generate' }
  s.vendored_frameworks = 'Static/IGListDiffKit.framework'
end
