# required in "abstract_graph/composition"

module AbstractGraph
  module Composition

    # public Edge class
    class Edge
      attr_reader :name
      attr_accessor :vertices

      # d: Set the name of edge.
      # a: Throw an ArgumentError if the name is not a string
      # t: constant
      # p: name should be string
      # r: The name
      def name=(name)
        raise ArgumentError if name.class != String
        @name = name
      end

    end
  end
end

require "abstract_graph/composition/edge/initialize"
require "abstract_graph/composition/edge/is_coincident"
