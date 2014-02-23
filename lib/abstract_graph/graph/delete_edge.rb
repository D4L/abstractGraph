# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Delete an edge.
    # a: Deletes the edge.
    # t: constant
    # p: s is the edge name
    # r: graph itself
    def delete_edge( s )
      other = self.dup
      other.delete_edge! s
    end

    def delete_edge!( s )
      @edges.delete s
      self
    end

  end
end
