# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Copies the implementation
      # a: Does a deep copy, cannot use dup because hash and array dup is shallow
      # t: |vertices| + |edges|
      # p: none
      # r: returns the copy implementation
      def dup
        other = self.class.new

        # create a dup adjacency list by going through each struct and duping it
        dup_adjacency_list = {}
        @adjacency_list.each do |vertex, collection_list|
          current_collection_list = dup_adjacency_list[vertex.dup] = []
          collection_list.each do |edge|
            current_collection_list << edge.dup
          end
        end

        other.instance_variable_set :@adjacency_list, dup_adjacency_list
        other
      end

    end
  end
end
