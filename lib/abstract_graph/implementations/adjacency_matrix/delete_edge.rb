# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Delete an edge from the implementation.
      # a: Retrieve the vertices for the edge, and delete it from the vertices' lists.
      #   Delete the edge from data as well.
      # t: constant
      # p: s is the edge name
      # r: implementation itself
      def delete_edge s
        other = self.dup
        other.delete_edge! s
      end

      def delete_edge! s
        raise Exception unless @data[s]
        vertices = @data[s][:vertices]
        @adjacency_matrix[vertices[0]].delete vertices[1]
        @adjacency_matrix[vertices[1]].delete vertices[0]
        @data.delete s
        self
      end

    end
  end
end
