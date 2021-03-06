# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/date_logic/version'

Gem::Specification.new do |spec|

  spec.name          = 'jekyll-date_logic'
  spec.version       = Jekyll::DateLogic::VERSION
  spec.authors       = ['Greg Scott']
  spec.email         = ['me@gregoryjscott.com']
  spec.summary       = %q{Custom jekyll blocks for applying date logic.}
  spec.homepage      = 'https://github.com/cityoffortworth/jekyll-date_logic'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'jekyll', '~> 2.5'
  spec.add_development_dependency 'mocha', '~> 1.1'

end
