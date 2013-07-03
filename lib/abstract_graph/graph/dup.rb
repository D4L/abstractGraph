# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # does a deep copy of the graph
    def dup
      other = self.class.new
      other.vertices = @vertices.dup
      other.edges = @edges.dup
      other
    end

  end
end
