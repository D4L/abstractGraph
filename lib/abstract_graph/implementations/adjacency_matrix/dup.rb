# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Copies the implementation
      # a: Go through and copy over the adjacency matrix, and then the data. Then set the new object
      #   appropriately.
      # t: |vertices| + |edges|
      # p: none
      # r: returns the copy implementation
      def dup
        other = self.class.new

        # create a dup adjacency matrix by going through each collection
        dup_adjacency_matrix = {}
        @adjacency_matrix.each do |vertex, collection_list|
          dup_adjacency_matrix[vertex] = collection_list.dup
        end

        # create a dup data by going through and duping properly
        dup_data = {}
        @data.each do |name, details|
          dup_data[name] = details
        end

        other.instance_variable_set :@adjacency_matrix, dup_adjacency_matrix
        other.instance_variable_set :@data, dup_data
        other
      end

    end
  end
end
