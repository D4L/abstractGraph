# required in "abstract_graph/composition/edge"

module AbstractGraph
  module Composition
    class Edge

      # returns whether or not e covers the same two vertices
      # p: Edge e is the comparing edge
      def is_coincident? e
        return ( ( e.vertices | @vertices ) - ( e.vertices & @vertices ) ).empty?
      end

    end
  end
end
