# required in "abstract_graph/implementations/naive"

module AbstractGraph
  module Implementations
    class Naive

      # d: Add a vertex to implementation.
      # a: Adds the new vertex.
      # t: constant
      # p: s is the name of the vertex
      # r: returns the implementation
      def add_vertex( s )
        # create the vertex
        vertex = Vertex.new s
        @vertices.add vertex
        self
      end

    end
  end
end
