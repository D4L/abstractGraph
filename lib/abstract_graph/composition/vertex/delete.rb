# required in "abstract_graph/composition/vertex"

module AbstractGraph
  module Composition
    class Vertex

      def delete
        @@names.delete @name
        nil
      end

    end
  end
end
