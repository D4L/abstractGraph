# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Returns the set of edges.
      # a: collect a set with all of the values of the adjacency_matrix hash
      # t: |vertices|
      # p:
      # r: Set of strings.
      def edges
        Set.new(
          @adjacency_matrix.values.collect do |collection_list|
            collection_list.values
          end.flatten
        )
      end

    end
  end
end
