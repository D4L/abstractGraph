a = AbstractGraph::Graph.new implementation: :naive
20_000.times do |i|
  a.add_vertex "v#{i}"
end
