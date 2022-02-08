lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isics/version'

Gem::Specification.new do |spec|
  spec.name          = 'isics'
  spec.version       = Isics::VERSION
  spec.authors       = ['Takahiro SATOH']
  spec.email         = ['zalt50cc@gmail.com']
  spec.summary       = 'class for calculation of ECPSSR and PWBA cross sections'
  spec.description   =
    'ISICSoo is a C++ language class, written from ISICS2008'
  spec.homepage      = 'https://github.com/zalt50/isics-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.extensions    = %w[ext/isics/extconf.rb]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'shoulda'
end
