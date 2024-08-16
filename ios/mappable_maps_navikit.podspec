Pod::Spec.new do |s|
  s.name             = 'mappable_maps_navikit'
  s.version          = '1.0.0'
  s.summary          = 'Mappable mapkit flutter plugin'
  s.description      = 'Mappable mapkit flutter plugin'
  s.authors          = 'Mappable'
  s.homepage         = 'none'
  s.license          = { :file => '../LICENSE' }
  s.source           = { :path => '.' }
  s.platform = :ios, "7.0"
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'

  s.frameworks = 'CoreFoundation', 'Foundation', 'CoreLocation', 'UIKit', 'OpenGLES', 'SystemConfiguration', 'CoreGraphics', 'QuartzCore', 'Security', 'CoreTelephony', 'CoreMotion', 'DeviceCheck'

  mapkit_version = '4.7.2-beta-navikit-flutter'

  s.libraries = 'resolv', 'c++'
  s.static_framework = true
  # Flutter dynamicaly lookup all symbols from executable, so we need for
  # all exported symbols will be available from executable.
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
  s.dependency 'MappableMapsMobile', mapkit_version

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end