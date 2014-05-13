# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Delete an edge from the implementation.
      # a: Goes through the adjacency list values and for each adjacency list, delete the edge
      #   if it shows up inside, found by name.
      # t: |edges|
      # p: s is the edge name
      # r: implementation itself
      def delete_edge s
        other = self.dup
        other.delete_edge! s
      end

      def delete_edge! s
        @adjacency_list.values.each do |connection_list|
          connection_list.delete_if do |edge_struct|
            edge_struct.name == s
          end
        end
      end

    end
  end
end
