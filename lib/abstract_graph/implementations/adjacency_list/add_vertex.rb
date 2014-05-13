# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Adds a vertex.
      # a: Create the new vertex struct and add it to the adjacency list.
      # t: Constant
      # p: s is the name of the vertex
      # r: returns the implementation
      def add_vertex s
        vertex = Vertex.new s
        raise Exception if @adjacency_list[vertex]
        @adjacency_list[vertex] = []
        self
      end

    end
  end
end
