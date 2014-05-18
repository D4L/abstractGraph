# required in "abstract_graph/implementations/dynamic_impl"

module AbstractGraph
  module Implementations
    class DynamicImpl

      # d: Duplicates the implementation.
      # a: Sets the instance variable of a new class instance to all the dup/copies.
      # t: constant
      # p:
      # r: copy of the implementation
      def dup
        other = self.class.new

        other.instance_variable_set :@secret_graph_impl, @secret_graph_impl.dup
        other.instance_variable_set :@secret_impl, @secret_impl
        other.instance_variable_set :@num_vertices, @num_vertices
        other.instance_variable_set :@num_edges, @num_edges

        other
      end

    end
  end
end
