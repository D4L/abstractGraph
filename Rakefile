#!/usr/bin/env rake
require "bundler/gem_tasks"

require "rspec/core/rake_task"

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = %w(-fs --color)
end

task :default => :spec

desc "Builds gem"
task :build_gem do
  puts %s{gem build abstract_graph.gemspec}
  output = `gem build abstract_graph.gemspec`
  p output
  print %s{Do you want to install the gem (y|n)? }
  while !%w{y n}.include?(inputs = STDIN.gets[0])
    print %s{Please use either y or n: }
  end
  if inputs == 'y'
    sh %s{gem install }.to_s + output.split.last
  else
    p %s{Alright, peace out.}
  end
end
