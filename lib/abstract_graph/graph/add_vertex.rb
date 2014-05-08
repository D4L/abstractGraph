# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Add a vertex to graph.
    # a: Adds the new vertex to the implementation.
    # t: constant
    # p: s is the name of the vertex
    # r: returns the graph itself
    def add_vertex( s )
      @graph_impl.add_vertex s
      self
    end

  end
end
