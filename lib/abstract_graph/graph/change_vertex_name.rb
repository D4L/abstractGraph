# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Change the name of an vertex
    # a: Changes the name of an vertex by checking existing names and then adding our own
    # t: t(rename), which is |edges + vertex|
    # p: s is current name of vertex, snew is requested name of vertex
    # r: returns graph if everything goes well, nil if it failed
    def change_vertex_name( s, snew )
      return nil if @vertices.rename(s, snew).nil?
      self
    end

  end
end
