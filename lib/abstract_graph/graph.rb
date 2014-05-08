# required in "abstract_graph"

module AbstractGraph

  # public Graph class
  class Graph

    attr_reader :implementation
    @@implementation_list = {}

  end

end

require "abstract_graph/graph/initialize"
require "abstract_graph/graph/add_vertex"
require "abstract_graph/graph/has_vertex"
require "abstract_graph/graph/dup"
require "abstract_graph/graph/delete_vertex"
require "abstract_graph/graph/add_edge"
require "abstract_graph/graph/has_edge"
require "abstract_graph/graph/delete_edge"
require "abstract_graph/graph/change_vertex_name"
require "abstract_graph/graph/change_edge_name"
require "abstract_graph/graph/is_adjacent"
require "abstract_graph/graph/adjacency_list"
require "abstract_graph/graph/merge_vertices"
require "abstract_graph/graph/get_edge_name"
require "abstract_graph/graph/templates"
require "abstract_graph/graph/split_vertex"
require "abstract_graph/graph/connected"
require "abstract_graph/graph/implementation"
require "abstract_graph/graph/add_implementation"

# class initiation stuff
module AbstractGraph
  class Graph

    add_implementation :naive, Implementations::Naive
    add_implementation :adjacency_list, Implementations::AdjacencyList

  end
end
