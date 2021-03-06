# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = "Codebreaker_RG2016"
  spec.version       = Codebreaker::VERSION
  spec.authors       = ["Ajiexwel4"]
  spec.email         = ["ajiexwel4@gmail.com"]

  spec.summary       = "Codebreaker is a logic game"
  spec.description   = "Codebreaker is a logic game in which a code-breaker tries to break a secret code created by a code-maker"
  spec.homepage      = "https://github.com/Ajiexwel4/Codebreaker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
