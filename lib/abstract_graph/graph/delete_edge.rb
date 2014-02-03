# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # delete an edge in a replicated graph
    # p: String s represents the name of the edge
    def delete_edge( s )
      other = self.dup
      other.delete_edge! s
    end

    # delete an edge in a current graph
    # p: String s represents the name of the edge
    def delete_edge!( s )
      #TODO write a UniqueNameCollection#delete method
      @edges.collection.delete s
      self
    end

  end
end
