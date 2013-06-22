# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # create a variable sized path graph,
      #   ie, a connected graph with 2 end vertices and n-2 connector
      #   vertices. Each connector vertex has two adjacent vertices
      # p: the number of vertices in the path, n-1 edges
      def path_graph n
        result = Graph.new

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

