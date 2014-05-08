# required in "abstract_graph/implementations"

module AbstractGraph
  module Implementations

    class Naive

      # Add the vertex and edge classes
      include Composition

      attr_accessor :vertices
      attr_accessor :edges

    end

  end
end

naive_path = "abstract_graph/implementations/naive"
require naive_path + "/initialize"
require naive_path + "/add_vertex"
require naive_path + "/add_edge"
require naive_path + "/delete_edge"
require naive_path + "/delete_vertex"
require naive_path + "/vertices"
require naive_path + "/edges"
require naive_path + "/dup"
require naive_path + "/adjacency_list"
