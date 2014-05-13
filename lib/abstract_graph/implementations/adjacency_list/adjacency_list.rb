# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Returns the adjacency list of a particular vertex.
      # a: Goes through the adjacency list of the particular vertex, and extracts the vertex
      #   adjacent_to, and the edge name, then wraps that all into a hash.
      # t: |edges|
      # p: s is the name of the vertex
      # r: returns nil if nothing, returns hash of { vertex => edge }
      def adjacency_list s
        result = Hash[
          @adjacency_list[Vertex.new(s)].collect do |edge_struct|
            [edge_struct.adjacent_to, edge_struct.name]
          end
        ]
        result.size > 0 ? result : nil
      end

    end
  end
end
