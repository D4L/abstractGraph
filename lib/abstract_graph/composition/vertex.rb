# required in "abstract_graph/composition"

module AbstractGraph
  module Composition

    # public Vertex class
    class Vertex
      attr_reader :name
      @@names = []

      def name=(name)
        raise ArgumentError if name.class != String
        raise Exception if @@names.include? name
        @@names.delete @name
        @name = name
        @@names.push name
      end

    end
  end
end

require "abstract_graph/composition/vertex/initialize"
