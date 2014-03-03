#!/usr/bin/env rake

# Add paths
$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../lib', __FILE__)

require "lib/abstract_graph"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = %w(-fs --color)
end

task :default => :spec

desc "Run tests (same as rake spec)"
task :test => :spec

require "tasks/create_method"
require "tasks/list_methods"
require "tasks/benchmark"

