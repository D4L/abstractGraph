# -*- encoding: utf-8 -*-
require File.expand_path('../lib/abstract_graph/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "abstract_graph"
  gem.version       = AbstractGraph::VERSION

  gem.authors       = ["Austin Lee ~D4L"]
  gem.email         = ["Austin.Lee.D4L@gmail.com"]
  gem.description   = %q{Abstract Graph is a graphing library that can create
                         mathematical graphs and perform operatations on them.}
  gem.summary       = %q{Mathmatical graph analysis software.}
  gem.homepage      = "https://github.com/D4L/abstractGraph"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.5'
end
