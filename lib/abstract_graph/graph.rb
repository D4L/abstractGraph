# required in "abstract_graph"

module AbstractGraph

  # public Graph class
  class Graph

    # Add the vertex and edge classes
    include Composition

    attr_accessor :vertices

  end

end

require "abstract_graph/graph/initialize"
require "abstract_graph/graph/add_vertex"
