Pod::Spec.new do |s|
    s.name         = 'MJRefresh'
    s.version      = '3.5.1'
    s.summary      = 'An easy way to use pull-to-refresh'
    s.homepage     = 'https://github.com/CoderMJLee/MJRefresh'
    s.license      = 'MIT'
    s.authors      = {'MJ Lee' => 'richermj123go@vip.qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/CoderMJLee/MJRefresh.git', :tag => s.version.to_s }
    s.resource     = 'Static/MJRefresh.framework/MJRefresh.bundle'
    s.vendored_frameworks = 'Static/MJRefresh.framework'
    s.requires_arc = true
end