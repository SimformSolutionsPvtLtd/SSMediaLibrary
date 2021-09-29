Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '13.0'
s.name = "SSMediaLibrary"
s.summary = "SSMediaLibrary lets a user open any file"

s.version = "0.1.8"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Devansh Vyas" => "devansh.v@simformsolutions.com" }

s.homepage = "https://github.com/devansh-v-simformsolutions/SSMediaLibrary"

s.source = { :git => "https://github.com/devansh-v-simformsolutions/SSMediaLibrary.git",
             :tag => "#{s.version}" }

s.framework = "UIKit"

s.source_files = "SSMediaLibrary/**/*.{h,m,swift}"

s.swift_version = "5.0"

end
