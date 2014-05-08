# required in "abstract_graph/implementations/naive"

module AbstractGraph
  module Implementations
    class Naive

      # d: Returns a set of edge names.
      # a: Retrieves the keys of the edges collection and puts it into a set.
      # t: constant
      # p:
      # r: Set of strings.
      def edges
        Set.new(@edges.collection.keys)
      end

    end
  end
end
