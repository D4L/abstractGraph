# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Adds a vertex.
      # a: Add the vertex to the adjacency_matrix implementation
      # t: Constant
      # p: s is the name of the vertex
      # r: returns the implementation
      def add_vertex s
        raise Exception if @data.include? s
        @data[s] = {}
        @adjacency_matrix[s] = {}
        self
      end

    end
  end
end
