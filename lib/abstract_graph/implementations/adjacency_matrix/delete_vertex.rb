# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Delete the vertex from the implementation.
      # a: Go through the adjacency matrix and delete the vertex if it appears in the list,
      #   also delete the vertex from the matrix, and from data.
      # t: |vertices| * |edges|
      # p: s is the vertex name
      # r: implementation itself
      def delete_vertex( s )
        other = self.dup
        other.delete_vertex! s
      end

      def delete_vertex!( s )
        @adjacency_matrix.delete s
        @adjacency_matrix.each_value do |collection_list|
          collection_list.delete_if do |vertex, edge|
            vertex == s
          end
        end
        @data.delete s
        self
      end

    end
  end
end
