lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isics/version'
require 'mkmf'

Gem::Specification.new do |spec|
  spec.name          = 'isics'
  spec.version       = Isics::VERSION
  spec.authors       = ['Takahiro SATOH']
  spec.email         = ['zalt50cc@gmail.com']
  spec.summary       = 'class for calculation of ECPSSR and PWBA cross sections'
  spec.description   = 'ISICSoo is a C++ language class, written from ISICS2008'
  spec.homepage      = 'https://github.com/zalt50/isics-ruby'
  spec.license       = 'MIT'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extensions    = %w[ext/isics/extconf.rb]
  spec.files         = `git ls-files -z`.split("\x0")

  isics_src = File.expand_path(arg_config('--isics-src', 'aekn_v1_1.tar.gz'), __dir__)
  system("tar xvf \"#{isics_src}\" --strip-components 1 -C \"#{__dir__}/ext/isics\" >/dev/null 2>&1")
  system("swig -c++ -ruby -autorename \"#{__dir__}/ext/isics/isics.i\" >/dev/null 2>&1")
  spec.files.push('ext/isics/isics_wrap.cxx', 'ext/isics/isics.cc', 'ext/isics/isics.hh', 'ext/isics/pod.h')
  spec.files.push(*Dir.glob('ext/isics/*.dat'))

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'shoulda'
end
