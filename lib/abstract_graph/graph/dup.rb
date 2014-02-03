# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # does a deep copy of the graph
    def dup
      other = self.class.new
      # cannot call UniqueNameCollection#dup because we'll lose
      # link data
      @vertices.each do |v|
        other.vertices.add v
      end
      @edges.each do |e|
        other.edges.add e
      end
      other
    end

  end
end
