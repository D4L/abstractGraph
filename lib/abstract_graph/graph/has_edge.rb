# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Checks if graph has the edge.
    # a: Check implementation if it has edge.
    # t:
    # p: name of edge
    # r: true/false depending if edge with name s exists
    def has_edge?( s )
      @graph_impl.edges.include? s
    end

  end
end
