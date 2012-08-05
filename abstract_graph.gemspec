# -*- encoding: utf-8 -*-
require File.expand_path('../lib/abstract_graph/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "abstract_graph"
  gem.version       = AbstractGraph::VERSION

  gem.authors       = ["Austin Lee ~D4L"]
  gem.email         = ["Austin.Lee.D4L@gmail.com"]
  gem.description   = %q{Abstract Graph is a super graph program that will be able to create mathematical
  graphs and then we can run graph analysis algorithms such as shortest path.}
  gem.summary       = %q{Mathmatical graph analysis software.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.5'
end
