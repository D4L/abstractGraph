# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Change the attribute of an object
      # a: If attr is name, then figure out if it's a vertex or edge. If it's an edge, check the
      #   data for vertices, and then appropriately switch them. If vertex, need to change for
      #   every instance possible in the entire matrix.
      # t: |vertices| * |edges|
      # p: name is the name of the resource, whether it's a vertex or edge.
      #   attr is the attribute we want to set, value is the requested value
      #   on that attribute.
      # r: nil if anything fails, otherwise, self
      def set_data name, attr, value
        return nil unless @data[name]
        if attr == :name
          raise Exception if @data[value]
          if @data[name][:vertices]
            # this resource's an edge
            vertices = @data[name][:vertices]
            @adjacency_matrix[vertices[0]][vertices[1]] = value
            @adjacency_matrix[vertices[1]][vertices[0]] = value
            @data[value] = @data[name]
            @data.delete name
          else
            @adjacency_matrix[value] = @adjacency_matrix[name]
            @adjacency_matrix.each_value do |collection_list|
              next unless collection_list[name]

              # change the edge's vertices in data
              @data[collection_list[name]][:vertices].delete name
              @data[collection_list[name]][:vertices] << value

              # change the vertex name in the collection list
              collection_list[value] = collection_list[name]
              collection_list.delete name
            end
            @adjacency_matrix.delete name
            @data[value] = @data[name]
            @data.delete name
          end
        end
        self
      end

    end
  end
end
