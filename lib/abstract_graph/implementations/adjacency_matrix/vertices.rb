# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Returns the list of vertices.
      # a: Returns the keys of the adjacency matrix hash.
      # t: constant
      # p:
      # r: Set of strings.
      def vertices
        Set.new(@adjacency_matrix.keys)
      end

    end
  end
end
