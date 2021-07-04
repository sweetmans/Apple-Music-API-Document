Pod::Spec.new do |s|
  s.name = 'MusicDoge'
  s.version = '0.1.30'
  s.license = 'MIT'
  s.summary = 'Elegant Apple Music API in Swift'
  s.homepage = 'https://github.com/sweetmans/Apple-Music-API-Document'
  s.authors = { 'S.M Technology Ltd.' => 'bp@sweetman.cc' }
  s.source = { :git => 'https://github.com/sweetmans/Apple-Music-API-Document.git', :tag => s.version }
  s.documentation_url = 'https://Apple-Music-API-Document.github.io/Apple-Music-API-Document/'
  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5.1', '5.2', '5.3', '5.4']
  s.source_files = 'MusicDoge/MusicDoge/Classes/**/*.swift'
  s.frameworks = 'Alamofire'
end
