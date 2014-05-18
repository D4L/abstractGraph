# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Export all the vertices and edges of the graph.
      # a: First adds the vertices by pulling out the names of the key of adjacency_list. Then
      #   adds each edge by creating a set of edge names so that duplicates aren't added. If
      #   a non-duplicate is found, then add to the result given all the edge info we have.
      # t: |edges| + |vertices|
      # p:
      # r: A hash that represents the representation, has :vertices, :edges.
      def export
        result = {}
        result[:vertices] = @adjacency_list.keys.map(&:name)
        result[:edges] = []
        edges = Set.new
        @adjacency_list.each do |vertex, collection_list|
          collection_list.each do |edge_struct|
            next if edges.include? edge_struct.name
            edges << edge_struct.name
            result[:edges] << {
              name: edge_struct.name,
              vertices: [vertex.name, edge_struct.adjacent_to]
            }
          end
        end
        result
      end

    end
  end
end
