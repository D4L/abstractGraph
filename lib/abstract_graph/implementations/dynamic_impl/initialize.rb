# required in "abstract_graph/implementations/dynamic_impl"

module AbstractGraph
  module Implementations
    class DynamicImpl

      # d: Create the dynamic implementation.
      # a: Create the secret implementation and several tallies.
      # t: constant
      # p:
      # r: new implementation
      def initialize(options = {})

        @num_vertices = 0
        @num_edges = 0
        @secret_graph_impl = AdjacencyList.new
        @secret_impl = :adjacency_list
      end

    end
  end
end
