# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Checks if graph has the edge.
    # a: Run find on @edges and existance it.
    # t: constant
    # p: name of edge
    # r: true/false depending if edge with name s exists
    def has_edge?( s )
      !(@edges.find s).nil?
    end

  end
end
