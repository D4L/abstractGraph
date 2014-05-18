# required in "abstract_graph/implementations/adjacency_matrix"

module AbstractGraph
  module Implementations
    class AdjacencyMatrix

      # d: Import the hash into the graph.
      # a: Go through the vertices in info, and add each one, then go through the edges
      #   and add the edges.
      # t: |edges| + |vertices|
      # p: Takes in a hash with all the info for the graph
      # r: The impl itself
      def import info
        info[:vertices].each do |vertex|
          add_vertex vertex
        end
        info[:edges].each do |edge|
          add_edge edge[:name], *edge[:vertices]
        end
        self
      end

    end
  end
end
