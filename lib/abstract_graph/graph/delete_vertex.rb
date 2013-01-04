# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # delete a vertex in a new graph
    # p: String s represents the name of the vertex
    def delete_vertex( s )
      other = self.dup
      other.delete_vertex! s
    end

    # delete a vertex in a current graph
    # p: String s represents the name of the vertex
    def delete_vertex!( s )
      @vertices.delete s
      self
    end

  end
end
