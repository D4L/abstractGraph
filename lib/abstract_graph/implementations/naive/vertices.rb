# required in "abstract_graph/implementations/naive"

module AbstractGraph
  module Implementations
    class Naive

      # d: Returns a set of vertex names.
      # a: Retrieves the keys of the vertex collections and puts it into a set.
      # t: constant
      # p:
      # r: Set of strings.
      def vertices
        Set.new(@vertices.collection.keys)
      end

    end
  end
end
