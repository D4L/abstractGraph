# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Create a hash that described all the vertices and edges.
      # a: First add vertices, then for each edge, add itself and the vertices adjacent.
      # t: |edges|
      # p:
      # r: A hash that represents the representation, has :vertices, :edges.
      def export
        result = {}
        result[:vertices] = @adjacency_matrix.keys
        result[:edges] = []
        (@data.keys - result[:vertices]).each do |edge|
          result[:edges] << {
            name: edge,
            vertices: @data[edge][:vertices]
          }
        end
        result
      end

    end
  end
end
