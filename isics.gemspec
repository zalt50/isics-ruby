# frozen_string_literal: true

require_relative "lib/isics/version"
require "mkmf"

Gem::Specification.new do |spec|
  spec.name          = "isics"
  spec.version       = Isics::VERSION
  spec.authors       = ["Takahiro SATOH"]
  spec.email         = ["zalt50cc@gmail.com"]
  spec.summary       = "class for calculation of ECPSSR and PWBA cross sections"
  spec.description   = "ISICSoo is a C++ language class, written from ISICS2008"
  spec.homepage      = "https://github.com/zalt50/isics-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  isics_src = File.expand_path(arg_config("--isics-src", "aekn_v1_1.tar.gz"), __dir__)
  system("tar xvf \"#{isics_src}\" --strip-components 1 -C \"#{__dir__}/ext/isics\" >/dev/null 2>&1")
  system("swig -c++ -ruby -autorename \"#{__dir__}/ext/isics/isics.i\" >/dev/null 2>&1")
  spec.files.push("ext/isics/isics_wrap.cxx", "ext/isics/isics.cc", "ext/isics/isics.hh", "ext/isics/pod.h")
  spec.files.push(*Dir.glob("ext/isics/*.dat"))

  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = %w[ext/isics/extconf.rb]
end
