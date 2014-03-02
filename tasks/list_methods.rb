desc "List all methods"
task :list_methods do
  puts Dir.glob("lib/**/*").select {|f| File.file? f}.map {|f| f[/(?<=lib\/).*/]}
end

