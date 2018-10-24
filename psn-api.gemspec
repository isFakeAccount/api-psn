# coding: utf-8
require './lib/psn/version'

Gem::Specification.new do |spec|
  spec.name          = 'psn-api'
  spec.version       = PSN::VERSION
  spec.authors       = ['Vlad Radulescu']
  spec.email         = ['oss@games.directory']

  spec.summary       = %q{  }
  spec.description   = %q{  }
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.16'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'pry'
end
