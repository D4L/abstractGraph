# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns whether or not v1 and v2 are joined by an edge
    # p: String v1, v2 represents the names of the vertices
    def is_adjacent?( v1, v2 )
      vertices = [v1, v2].sort!

      ( @edges.each.find do |e|
        vertices == e.vertices.map(&:name).sort
      end && true ) || false
    end

  end
end
