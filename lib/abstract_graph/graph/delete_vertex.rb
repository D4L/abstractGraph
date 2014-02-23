# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Delete an vertex.
    # a: Deletes the vertex.
    # t: constant
    # p: s is the vertex name
    # r: graph itself
    def delete_vertex( s )
      other = self.dup
      other.delete_vertex! s
    end

    def delete_vertex!( s )
      @vertices.delete s
      self
    end

  end
end
