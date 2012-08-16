# required in "abstract_graph/composition/vertex"

module AbstractGraph
  module Composition
    class Vertex

      def initialize (name="", value=nil)
        @name = name
        @value = value
        if @@names.include? name
          raise Exception
        end
        @@names.push name
      end

    end
  end
end
