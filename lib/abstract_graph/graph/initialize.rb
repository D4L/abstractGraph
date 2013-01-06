# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # public constructor
    def initialize

      @vertices = UniqueNameCollection.new
      @edges = UniqueNameCollection.new
      @vertices.link @edges

    end

  end
end
