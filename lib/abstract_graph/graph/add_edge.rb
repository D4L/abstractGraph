# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Add an edge to graph.
    # a: Add the edge to the implementation.
    # t:
    # p: s is name of edge, v1 and v2 are names of the two vertices
    # r: returns the graph itself
    def add_edge( s, v1, v2 )
      return nil unless @graph_impl.add_edge s, v1, v2
      self
    end

  end
end
