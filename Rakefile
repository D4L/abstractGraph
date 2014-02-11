#!/usr/bin/env rake
require "bundler/gem_tasks"

require "rspec/core/rake_task"

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = %w(-fs --color)
end

task :default => :spec

desc "Run tests (same as rake spec)"
task :test => :spec

desc "Create a method and corresponding test - run with wanted lib file"
task :create_method, :method_path do |t, args|
  method_path = args[:method_path]
  if File.extname(method_path) == ""
    method_path << ".rb"
  end

  lib_path = "lib/" + method_path
  spec_path = "spec/" + method_path


  if File.file?( lib_path ) || File.file?( spec_path )
    puts "This file already exists"
    next
  end

  puts "Adding #{lib_path} and #{spec_path}"
end

desc "List all methods"
task :list_methods do
  puts Dir.glob("lib/**/*").select {|f| File.file? f}.map {|f| f[/(?<=lib\/).*/]}
end
