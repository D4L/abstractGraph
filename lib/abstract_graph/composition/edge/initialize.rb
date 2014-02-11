# required in "abstract_graph/composition/edge"

module AbstractGraph
  module Composition
    class Edge

      # d: Create an edge with a name and two vertices
      # a: Check if a string is passed, otherwise, the next two must be the vertices
      # t: constant
      # p: name if we want to name our edge, otherwise it'll be ""
      #   The next two args are the two vertices that this edge connects
      # r: Edge object
      def initialize ( *args )
        if args[0].class == String
          @name = args[0]
        else
          @name = ""
        end
        @vertices = args[-2, 2]
      end

    end
  end 
end
