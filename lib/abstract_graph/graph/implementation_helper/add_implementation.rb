# required in "abstract_graph/graph/implementation_helper"

module AbstractGraph
  class Graph
    module ImplementationHelper
      module ClassMethods

        # d: Adds an implementation to the list.
        # a: Simply implementation to the hash.
        # t: constant
        # p: Name of an implementation, and class
        # r: the name of the implementation
        def add_implementation implementation_name,implementation_class
          ImplementationHelper.implementation_list[implementation_name] = implementation_class
          implementation_name
        end

      end
    end
  end
end
