# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Initializes a graph
    # a: Sets the implementation of the graph.
    # t: constant
    # p:
    # r: new graph
    def initialize(options = {})
      self.implementation = options[:implementation] || :adjacency_list
    end

  end
end
