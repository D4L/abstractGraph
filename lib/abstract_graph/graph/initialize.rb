# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Initializes a graph
    # a: Creates a vertex and edge UNC and links them to share namespace
    # t: constant
    # p:
    # r: new graph
    def initialize(options = {})
      self.implementation = options[:implementation] || :adjacency_list
      @vertices = UniqueNameCollection.new
      @edges = UniqueNameCollection.new
      @vertices.link @edges
    end

  end
end
