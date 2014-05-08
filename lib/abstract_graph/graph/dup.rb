# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Copies the graph.
    # a: Does a deep copy, copies implementation.
    # t:
    # p: none
    # r: returns the copy graph
    def dup
      other = self.class.new implementation: @implementation
      other.instance_variable_set :@graph_impl, @graph_impl.dup
      other
    end

  end
end
