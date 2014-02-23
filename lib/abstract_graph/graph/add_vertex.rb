# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Add a vertex to graph.
    # a: Adds the new vertex.
    # t: constant
    # p: s is the name of the vertex
    # r: returns the graph itself
    def add_vertex( s )
      # create the vertex
      vertex = Vertex.new s
      @vertices.add vertex
      self
    end

  end
end
