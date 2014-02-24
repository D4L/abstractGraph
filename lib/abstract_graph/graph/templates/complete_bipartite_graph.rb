# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # d: Create a complete bipartite graph K(n,m).
      # a: It first adds the vertices, then adds the edges. The vertices are named "v(2^i)" from
      #   the first set being i=2^0..n-1, and the second set i=2^n..m+n-1. The edges are sums "e(i)"
      #   where i=sum of two vertices
      # t: n * m * t(add_edge) + max(n,m) * t(add_vertex)
      # p: n is the number of vertices in the first set, m is number of vertices in second set
      # r: a complete bipartite graph
      def complete_bipartite_graph n, m
        result = new

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
