# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Returns the adjacency list of a particular vertex.
      # a: Returns the store of the adjacency matrix at the given vertex.
      # t: constant
      # p: s is the name of the vertex
      # r: returns nil if nothing, returns hash of { vertex => edge }
      def adjacency_list s
        @adjacency_matrix[s].empty? ? nil : @adjacency_matrix[s].dup
      end

    end
  end
end
