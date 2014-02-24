# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # d: Create a complete graph K(n).
      # a: It adds n vertices, named "v(i)", i=2^0..n-1. Then adds the edges, the name being sum
      #   "e(i)" where i is sum of two connecting vertices.
      # t: n * t(add_vertex) + C(n,2) * t(add_edge)
      # p: n is number of vertices
      # r: a complete graph
      def complete_graph n
        result = new
        vertexNames = n.times.collect { |i| 2**i }
        vertexNames.each do |i|
          result.add_vertex "v#{i}"
        end
        vertexNames.combination(2).each do |i,j|
          result.add_edge( "e#{i+j}", "v#{i}", "v#{j}" )
        end
        result
      end

    end
  end
end
