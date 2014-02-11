# required in "abstract_graph/composition/edge"

module AbstractGraph
  module Composition
    class Edge

      # d: Check if two edges are covering the same vertices.
      # a: Compare the object_id, by extracting them and sorting them.
      # t: constant
      # p: Edge e is the comparing edge
      # r: true or false depending on coincident
      def is_coincident? e
        return e.vertices.map{|v| v.object_id}.sort == @vertices.map{|v| v.object_id}.sort
      end

    end
  end
end
