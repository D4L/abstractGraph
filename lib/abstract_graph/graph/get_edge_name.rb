# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Returns the edge name given two vertex names.
    # a: Goes through all the edges and see if any of them have the same vertices as
    #   the ones we are requesting.
    # t: |edges|
    # p: the names of the two vertices
    # r: nil if edge if nothing, name of edge(string) if found
    def get_edge_name( v1, v2 )
      @graph_impl.adjacency_list(v1)[ v2 ]
    end

  end
end
