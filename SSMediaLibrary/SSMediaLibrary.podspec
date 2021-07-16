Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "SSMediaLibrary"
s.summary = "SSMediaLibrary lets a user open any file"
s.requires_arc = true

# 2
s.version = "0.1.2"

# 3
# s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Devansh Vyas" => "devansh.v@simformsolutions.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/devansh-v-simformsolutions/SSMediaLibrary"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/devansh-v-simformsolutions/SSMediaLibrary.git",
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"

# 8
s.source_files = "SSMediaLibrary/**/*.{swift}"

# 10
s.swift_version = "5.0"

end
