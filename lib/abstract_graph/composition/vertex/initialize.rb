# required in "abstract_graph/composition/vertex"

module AbstractGraph
  module Composition
    class Vertex

      # d: Create a vertex object with a name.
      # a:
      # t: constant
      # p: name is the name of our vertex, default to "",
      #   optional value that can be tracked
      # r: The vertex
      def initialize (name="", value=nil)
        @name = name
        @value = value
      end

    end
  end
end
