# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Adds an edge.
      # a: Check that s isn't taken, v1 and v2 exist
      # t: constant
      # p: s is the name of the edge, v1 and v2 are names of the two vertices
      # r: returns the implementation itself
      def add_edge s, v1, v2
        # check if all the things are good
        raise Exception if @data.include? s
        return nil unless @adjacency_matrix.keys.include?(v1) && @adjacency_matrix.keys.include?(v2)
        raise Exception if @adjacency_matrix[v1][v2] || v1 == v2

        @data[s] = {:vertices => [v1, v2]}
        @adjacency_matrix[v1][v2] = s
        @adjacency_matrix[v2][v1] = s

        self
      end

    end
  end
end
