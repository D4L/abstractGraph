# required in "abstract_graph/implementations"

module AbstractGraph
  module Implementations

    class AdjacencyMatrix
    end

  end
end

adjacency_matrix_path = "abstract_graph/implementations/adjacency_matrix"

require adjacency_matrix_path + "/initialize"
require adjacency_matrix_path + "/add_vertex"
require adjacency_matrix_path + "/add_edge"
require adjacency_matrix_path + "/delete_edge"
require adjacency_matrix_path + "/delete_vertex"
require adjacency_matrix_path + "/vertices"
require adjacency_matrix_path + "/edges"
require adjacency_matrix_path + "/dup"
require adjacency_matrix_path + "/adjacency_list"
require adjacency_matrix_path + "/set_data"
