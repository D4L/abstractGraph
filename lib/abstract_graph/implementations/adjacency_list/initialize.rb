# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Creates an adjacency list implementation.
      # a: Initializes a variable adjacency_list to empty hash.
      # t: constant
      # p:
      # r: new implementation
      def initialize(options = {})
        @adjacency_list = {}
      end

    end
  end
end
