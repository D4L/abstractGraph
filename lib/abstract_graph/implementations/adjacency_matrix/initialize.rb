# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Creates an adjacency list implementation.
      # a: Creates a new hash for adjacency matrix
      # t: constant
      # p:
      # r: new implementation
      def initialize(options = {})
        @adjacency_matrix = {}
        @data = {}
      end

    end
  end
end
