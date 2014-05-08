# required in "abstract_graph/implementations/naive"

module AbstractGraph
  module Implementations
    class Naive

      # d: Add an edge to implementation.
      # a: Ensure the two vertices exist, then add the edge and check it's not coincident with any
      #   other edge.
      # t: |edges|
      # p: s is name of edge, v1 and v2 are names of the two vertices
      # r: returns the implementation itself
      def add_edge( s, v1, v2 )
        v1 = @vertices.find(v1) or return nil
        v2 = @vertices.find(v2) or return nil

        raise Exception.new( "AddEdge: Same vertices passed, #{v1.name}" ) if v1 == v2

        # create the edge
        edge = Edge.new s, v1, v2

        # check if it's an multiple edge
        @edges.each do |e|
          raise Exception.new( "AddEdge: Multiple edge being added between #{v1.name}, #{v2.name}" ) if e.is_coincident? edge
        end

        @edges.add edge
        self
      end

    end
  end
end
