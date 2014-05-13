# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Returns the list of vertices.
      # a: Goes through the adjacency list keys, which are the vertex objects, and retrieves
      #   the names before putting it in a set.
      # t: |vertices|
      # p:
      # r: Set of strings.
      def vertices
        Set.new @adjacency_list.keys.map(&:name)
      end

    end
  end
end
