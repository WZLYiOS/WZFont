Pod::Spec.new do |s|

  s.name             = 'WZFont'
  s.version          = '1.2.1'
  s.summary          = '我主良缘字体'

  s.description      = <<-DESC
    我主良缘技有限公司,iOS项目组字体组件.
                       DESC

  s.homepage         = 'https://github.com/WZLYiOS/WZFont'
  s.license          = 'MIT'
  s.author           = { 'xiaobin liu'=> '327847390@qq.com' }
  s.source           = { :git => 'https://github.com/WZLYiOS/WZFont.git', :tag => s.version.to_s }
  
  s.swift_version         = '5.0'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'WZFont/Core/*'
  s.resources = 'WZFont/Core/Resources/*'
end

