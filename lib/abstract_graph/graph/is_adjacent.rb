# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Check if two vertices are adjacent.
    # a: Go through the edges and check if any of the edges have the same vertices as the
    #   two query vertices
    # t: |edges|
    # p: v1 and v2 are the names of the vertices
    # r: true if the vertices are adjacent, false otherwise
    def is_adjacent?( v1, v2 )
      ( @graph_impl.adjacency_list(v1)[ v2 ] && true ) || false
    end

  end
end
