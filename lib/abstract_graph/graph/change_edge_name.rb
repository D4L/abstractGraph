# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Change the name of an edge
    # a: Changes the name of an edge by checking existing names and then adding our own
    # t: t(rename), which is |edges + vertex|
    # p: s is current name of edge, snew is requested name of edge
    # r: returns graph if everything goes well, nil if it failed
    def change_edge_name( s, snew )
      return nil unless @graph_impl.set_data(s, :name, snew)
      self
    end

  end
end
