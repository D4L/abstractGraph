# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns whether there exists a edge with name string
    # p: String s represents name of edge
    def has_edge?( s )
      #TODO: Add a UniqueNameCollection#find method
      @edges.collection.has_key? s
    end

  end
end
