# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Checks if the graph has the vertex.
    # a: Run find on the implementation 
    # t: constant
    # p: name of vertex
    # r: true/false depending if vertex with name s exists
    def has_vertex?( s )
      @graph_impl.vertices.include? s
    end

  end
end
