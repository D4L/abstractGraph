# required in "abstract_graph/composition/vertex"

module AbstractGraph
  module Composition
    class Vertex

      def initialize (name="", value="")
        @name = name
        if @@names.include? name
          raise Exception
        end
        @@names.push name
      end

    end
  end
end
