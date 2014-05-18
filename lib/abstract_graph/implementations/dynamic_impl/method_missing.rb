# required in "abstract_graph/implementations/dynamic_impl"

module AbstractGraph
  module Implementations
    class DynamicImpl

      # d: This is for most of the methods for this implementation.
      # a: First do the method on secret graph impl. Then tracks if it's add/delete vertex/edge.
      #   Then after calculating density, switches the implementation if it turns out to be
      #   past the threshold set to 0.8.
      # t: constant
      # p: m is method name, args are any args, block is a block
      # r: result of method if called normally.
      def method_missing m, *args, &block
        # proxy to the graph impl
        result = @secret_graph_impl.send(m, *args, &block)

        # book keeping!
        if m == :add_vertex
          @num_vertices += 1
        elsif m == :add_edge
          @num_edges += 1
        elsif m == :delete_vertex
          @num_vertices -= 1
        elsif m == :delete_edge
          @num_edges -= 1
        end

        # check density and modify if necessary
        density = (2 * @num_edges).to_f / (@num_vertices * (@num_vertices - 1)).to_f
        if density > 0.8 && @secret_impl == :adjacency_list
          @secret_impl = :adjacency_matrix
          @secret_graph_impl = AdjacencyMatrix.new.import(@secret_graph_impl.export)
        elsif density < 0.8 && @secret_impl == :adjacency_matrix
          @secret_impl = :adjacency_list
          @secret_graph_impl = AdjacencyList.new.import(@secret_graph_impl.export)
        end

        result
      end

    end
  end
end
