# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Adds an edge.
      # a: Create two edge structs, one for each of the vertices' list, then adds it to each of
      #   the lists. Checks many things, which takes a long time.
      # t: |edges|
      # p: s is the name of the edge, v1 and v2 are names of the two vertices
      # r: returns the implementation itself
      def add_edge s, v1, v2
        throw Exception if (v1 == v2) || (edges.include? s) || (@adjacency_list[Vertex.new(s)])

        # set up vertices and edges
        vertex1 = Vertex.new v1
        vertex2 = Vertex.new v2
        edge1 = Edge.new s, v2
        edge2 = Edge.new s, v1

        return nil unless @adjacency_list[vertex1] && @adjacency_list[vertex2]

        # check if multiple edge
        throw Exception if @adjacency_list[vertex1].find {|e| e.adjacent_to == v2}
        @adjacency_list[vertex1] << edge1
        @adjacency_list[vertex2] << edge2
        self
      end

    end
  end
end
