# frozen_string_literal: true

require_relative "lib/isics/version"
require "mkmf"

Gem::Specification.new do |spec|
  spec.name = "isics"
  spec.version  = Isics::VERSION
  spec.authors  = ["Takahiro SATOH"]
  spec.email = ["zalt50cc@gmail.com"]

  spec.summary = "class for calculation of ECPSSR and PWBA cross sections"
  spec.description = "ISICSoo is a C++ language class, written from ISICS2008"
  spec.homepage = "https://github.com/zalt50/isics-ruby"
  spec.required_ruby_version = ">= 3.0"

  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  isics_src = File.expand_path(arg_config("--isics-src", "aekn_v1_1.tar.gz"), __dir__)
  system("tar xvf \"#{isics_src}\" --strip-components 1 -C \"#{__dir__}/ext/isics\" >/dev/null 2>&1")
  system("swig -c++ -ruby -autorename \"#{__dir__}/ext/isics/isics.i\" >/dev/null 2>&1")
  spec.files.push(*Dir.glob("ext/isics/*.dat"))

  spec.extensions = %w[ext/isics/extconf.rb]
end
