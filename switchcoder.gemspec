# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'switchcoder/version'

Gem::Specification.new do |gem|
  gem.name          = "switchcoder"
  gem.version       = Switchcoder::VERSION
  gem.authors       = ["Scott Barstow"]
  gem.email         = ["scott@switchcoder.com"]
  gem.description   = %q{API wrapper to access SwitchCoder}
  gem.summary       = %q{This gem provides a simple API wrapper to access SwitchCoder from any ruby app.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  {
    "redcarpet" => "~> 1.17",
    "yard" => "~> 0.7.5",
    "rspec-core" => "~> 2.0",
    "rspec-expectations" => "~> 2.0",
    'json'  => "~> 1.7.7"
  }.each do |lib, version|
    gem.add_development_dependency(lib, *version)
  end

  #gem.add_runtime_dependency(lib, *version)
  
end
