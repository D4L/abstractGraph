# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Checks if the graph has the vertex.
    # a: Run find on @vertices and existance it.
    # t: constant
    # p: name of vertex
    # r: true/false depending if vertex with name s exists
    def has_vertex?( s )
      !(@vertices.find s).nil?
    end

  end
end
