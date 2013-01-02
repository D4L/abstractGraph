# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # add a vertex named s to the graph
    # p: String s represents the name of the wanted vertex
    def add_vertex( s )
      # create the vertex
      vertex = Vertex.new s
      @vertices.add vertex
      self
    end

  end
end
