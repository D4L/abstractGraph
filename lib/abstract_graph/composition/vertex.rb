# required in "abstract_graph/composition"

module AbstractGraph
  module Composition

    # public Vertex class
    class Vertex
      attr_reader :name
      attr_accessor :value

      def name=(name)
        raise ArgumentError if name.class != String
        @name = name
      end

    end
  end
end

require "abstract_graph/composition/vertex/initialize"
