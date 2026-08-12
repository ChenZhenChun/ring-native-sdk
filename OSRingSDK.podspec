Pod::Spec.new do |s|
  s.name                  = 'OSRingSDK'
  s.version               = '1.0.4'
  s.summary               = 'Smart ring native SDK binary dependencies.'
  s.description           = 'Binary SDK bundle used by the uts-ring-sdk UTS plugin.'
  s.homepage              = 'https://github.com/ChenZhenChun/ring-native-sdk'
  s.license               = { :type => 'Commercial', :text => 'Copyright belongs to the respective SDK owners.' }
  s.author                = { 'ChenZhenChun' => '346891964@qq.com' }
  s.source                = {
    :git => 'https://github.com/ChenZhenChun/ring-native-sdk.git',
    :tag => "v#{s.version}"
  }
  s.platform              = :ios, '12.0'
  s.requires_arc          = true
  s.vendored_frameworks   = 'ios/Frameworks/*.framework'
  s.frameworks            = [
    'UIKit',
    'Foundation',
    'AVFoundation',
    'CoreBluetooth',
    'CoreGraphics',
    'CoreTelephony',
    'CoreText',
    'ImageIO',
    'MobileCoreServices',
    'QuartzCore',
    'Security',
    'SystemConfiguration'
  ]
  s.libraries             = 'sqlite3', 'z', 'c++'
end
