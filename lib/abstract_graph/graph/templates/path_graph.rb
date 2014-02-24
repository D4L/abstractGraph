# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # d: Returns a path.
      # a: It creates a path.by adding vertices and edges at the same time, vertices named "v(i)"
      #   i=2^0..n-1, and edges "e(i)" where i is sum of vertices adjacent.
      # t: n * (t(add_vertex) + t(add_edge))
      # p: n is the number of vertices
      # r: a path graph
      def path_graph n
        result = new

        # add the first vertex
        result.add_vertex "v1"
        (1..n-1).each do |i|
          # add the rest of them
          result.add_vertex "v#{2**i}"
          result.add_edge "e#{2**i + 2**(i-1)}", "v#{2**i}", "v#{2**(i-1)}"
        end

        result
      end

    end
  end
end

