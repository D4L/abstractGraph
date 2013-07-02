# required in "abstract_graph"

module AbstractGraph

  # public Graph class
  class Graph

    # Add the vertex and edge classes
    include Composition

    attr_accessor :vertices
    attr_accessor :edges

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
