require "json"

 package = JSON.parse(File.read(File.join(__dir__, "package.json")))
 sync_version = `#{__dir__}/scripts/sync_version.sh #{package["version"]}`

 Pod::Spec.new do |s|
  s.name         = "urbanairship-react-native"
  s.version      = package["version"]
  s.summary      = package['description']
  s.author       = package['author']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/urbanairship/react-native-module.git", :tag => "{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"
  s.dependency "React"
  s.dependency "Airship", "13.3.2"

end
