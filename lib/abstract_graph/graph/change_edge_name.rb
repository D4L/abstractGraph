# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # changes an edge name to another valid name
    # p: String s represents the current edge we want to rename
    #    String snew is what we want to rename the edge to
    def change_edge_name( s, snew )
      return nil if @edges.rename(s, snew).nil?
      self
    end

  end
end
