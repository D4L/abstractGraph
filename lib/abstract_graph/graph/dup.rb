# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # does a deep copy of the graph
    def dup
      other = Graph.new
      other.vertices = @vertices.dup
      other
    end

  end
end
