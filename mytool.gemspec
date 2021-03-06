# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mytool/version'

Gem::Specification.new do |spec|
  spec.name          = "mytool"
  spec.version       = Mytool::VERSION
  spec.authors       = ["Naohiro Sakuma"]
  spec.email         = ["nao.bear@gmail.com"]
  spec.description   = %q{Set up to my machine.}
  spec.summary       = %q{Set up to my machine.}
  spec.homepage      = "https://github.com/n-sakuma/mytool"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = "mytool"
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "~> 0.18"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
