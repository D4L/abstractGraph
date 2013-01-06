# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns whether there exists a edge with name string
    # p: String s represents name of edge
    def has_edge?( s )
      @edges.has_key? s || false
    end

  end
end
