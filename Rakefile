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
  method_directories, method_name = File.split(method_path)
  method_name = File.basename(method_name, ".rb")

  lib_path = "lib/" + method_path
  spec_path = File.join "spec/", method_directories, method_name + "_spec.rb"
  lib_require_path = "lib/" + method_directories + ".rb"


  if File.file?( lib_path ) || File.file?( spec_path )
    puts "This file already exists"
    next
  end
  unless File.file?( lib_require_path )
    puts "No place to put the require"
    next
  end

  # Create the filler
  lib_fill = "# required in \"#{method_directories}\"\n\n"
  spec_fill = "require 'spec_helper'\n\n"

  modules = method_directories.split /\//
  modules.map! do |modulez|
    modulez.capitalize.gsub(/_./) {|s| s[1].capitalize}
  end
  last_module = modules.pop

  modules.each do |modulez|
    lib_fill << "module #{modulez}\n"
    spec_fill << "module #{modulez}\n"
  end

  lib_fill << "class #{last_module}\n"
  spec_fill << "describe #{last_module} do\n"

  lib_fill << "\n# d:\n# a:\n# t:\n# p:\n# r:\ndef #{method_name}\nend\n\n"
  spec_fill << "\ndescribe \"##{method_name}\" do\nend\n\n"

  modules.size.next.times do |i|
    lib_fill << "end\n"
    spec_fill << "end\n"
  end


  puts "Adding #{lib_path}"
  File.open( lib_path, "w" ) do |file|
    file << lib_fill
  end
  puts "Adding #{spec_path}"
  File.open( spec_path, "w" ) do |file|
    file << spec_fill
  end
  puts "Updating #{lib_require_path}"
  File.open( lib_require_path, "a" ) do |file|
    file.write "require \"#{method_directories}/#{method_name}\""
  end
end

desc "List all methods"
task :list_methods do
  puts Dir.glob("lib/**/*").select {|f| File.file? f}.map {|f| f[/(?<=lib\/).*/]}
end
