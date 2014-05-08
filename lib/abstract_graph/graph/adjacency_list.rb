# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Return adjacent vertices
    # a: Ask implementation for adjacency list.
    # t:
    # p: s is the name of vertex
    # r: returns nil if nothing, returns hash of { vertex_name => edge_name }
    def adjacency_list( s )
      @graph_impl.adjacency_list s
    end

  end
end
