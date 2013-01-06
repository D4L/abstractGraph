# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # add a vertex named s to the graph joining
    #   the vertices named v1 and v2
    # p: String s represents name
    #    Vertex name v1 and v2 are the two vertices
    # r: errors when v1, v2 doesn't exist, loop, or multiple edge
    def add_edge( s, v1, v2 )
      v1 = @vertices[v1] or return nil
      v2 = @vertices[v2] or return nil

      raise Exception if v1 == v2

      # create the edge
      edge = Edge.new s, v1, v2

      # check if it's an multiple edge
      @edges.each_value do |e|
        raise Exception if e.is_coincident? edge
      end

      @edges.add edge
      self
    end

  end
end
