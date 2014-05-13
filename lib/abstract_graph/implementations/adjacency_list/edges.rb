# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Returns the set of edges.
      # a: Goes through all the values of the adjacency list, flattens them, then extracts out
      #   the name. Finally, wraps it all in a set.
      # t: |edges|
      # p:
      # r: Set of strings.
      def edges
        Set.new @adjacency_list.values.flatten.map(&:name)
      end

    end
  end
end
