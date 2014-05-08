# required in "abstract_graph/implementations/naive"

module AbstractGraph
  module Implementations
    class Naive

      # d: Initializes a graph implementation.
      # a: Creates a vertex and edge UNC and links them.
      # t: constant
      # p:
      # r: new implementation
      def initialize(options = {})
        @vertices = UniqueNameCollection.new
        @edges = UniqueNameCollection.new
        @vertices.link @edges
      end

    end
  end
end
