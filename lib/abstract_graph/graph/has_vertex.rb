# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns whether there exists a vertex with name string
    # p: String s represents name of query vertex
    def has_vertex?( s )
      @vertices.has_key? s || false
    end

  end
end