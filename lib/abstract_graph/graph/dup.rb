# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Copies the graph.
    # a: Does a deep copy, but does not dup vertex/edge so modifying them will affect both graphs.
    #   Copies vertices then edges.
    # t: |vertices| + |edges|
    # p: none
    # r: returns the copy graph
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
