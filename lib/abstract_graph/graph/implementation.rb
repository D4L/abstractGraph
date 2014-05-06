# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Changes the implementation of the graph dynamically!.
    # a: Checks if it is a acceptable implementation, then sets it.
    # t: constant
    # p: The new implementation.
    # r: The implementation name.
    def implementation=(implementation)
      raise Exception unless @@implementation_list.include? implementation
      @implementation = implementation
    end

  end
end
