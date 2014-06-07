# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tz/version'

Gem::Specification.new do |spec|
  spec.name          = "tz"
  spec.version       = TZ::VERSION
  spec.authors       = ["Cecilia Rivero", "Cristian Rasch"]
  spec.email         = ["contact@ceciliarivero.com", "cristian@box.cristianrasch.com.ar"]
  spec.summary       = %q{Displays UTC time/datatime objects in a specified timezone.}
  spec.homepage      = "https://github.com/wecodeio/tz"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency "tzinfo"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.3.4"
  spec.add_development_dependency "minitest-line"
end
