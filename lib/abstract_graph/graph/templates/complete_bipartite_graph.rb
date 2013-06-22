# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # create a connected graph with two sets of vertices where
      #   the two sets only have vertices adjacent to the other set
      # p: the number of vertices in the two sets. the first set has
      #   n vertices from 2**(0..n-1) and the second set has m
      #   vertices from 2**(n**m+n-1)
      def complete_bipartite_graph n, m
        result = Graph.new

        # add the vertices to the graph
        vertexN = (0..n-1).map do |i|
          vName = 2**i
          result.add_vertex "v#{vName}"
          vName
        end
        vertexM = (0..m-1).map do |i|
          vName = 2**(n+i)
          result.add_vertex "v#{vName}"
          vName
        end

        # add the edges to the graph, and make sure they're
        # connected to the other set
        vertexN.each do |vn|
          vertexM.each do |vm|
            result.add_edge "e#{vn + vm}", "v#{vn}", "v#{vm}"
          end
        end

        result
      end

    end
  end
end
