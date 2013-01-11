# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # changes a vertex name to another valid name
    # p: String s represents the current vertex we want to rename
    #    String snew is what we want to rename the vertex to
    def change_vertex_name( s, snew )
      return nil if @vertices.rename(s, snew).nil?
      self
    end

  end
end
