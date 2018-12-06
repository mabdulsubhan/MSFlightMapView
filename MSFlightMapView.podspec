Pod::Spec.new do |s|
s.name             = 'MSFlightMapView'
s.version          = '0.2.0'
s.summary          = 'Flight animation on Google Maps'

s.description      = <<-DESC
MSFlightMapView helps you add flight animation on top of Google Maps
DESC

s.homepage         = 'https://github.com/mabdulsubhan/MSFlightMapView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Muhammad Abdul Subhan' => 'subhan.mps@gmail.com' }
s.source           = { :git => 'https://github.com/mabdulsubhan/MSFlightMapView.git', :tag => s.version.to_s }

s.ios.deployment_target = '10.0'
s.source_files = 'MSFlightMapView/MSFlightMapView/**/*.{h,m,swift}'
s.resources = 'MSFlightMapView/MSFlightMapView/Assets.xcassets/**/*'

s.static_framework = true
s.dependency 'GoogleMaps'

end
