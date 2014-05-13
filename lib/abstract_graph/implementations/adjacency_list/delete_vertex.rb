# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Delete the vertex from the implementation.
      # a: Finds the vertex and deletes it, then also deleting all the edges
      #   that are incident to the given vertex.
      # t: |edges|
      # p: s is the vertex name
      # r: implementation itself
      def delete_vertex( s )
        other = self.dup
        other.delete_vertex! s
      end

      def delete_vertex!( s )
        @adjacency_list.delete Vertex.new(s)
        @adjacency_list.values.each do |connection_list|
          connection_list.delete_if do |edge_struct|
            edge_struct.adjacent_to == s
          end
        end
      end

    end
  end
end
