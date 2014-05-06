# required in "abstract_graph/graph"

module AbstractGraph
  class Graph
    class << self

      # d: Adds an implementation to the list.
      # a: Add the implementation class to the hash referenced by implementation
      #   name.
      # t: constant
      # p: Name of an implementation, and class
      # r: the name of the implementation
      def add_implementation implementation_name,implementation_class
        @@implementation_list[implementation_name] = implementation_class
        implementation_name
      end

    end
  end
end
