# required in "abstract_graph/composition/edge"

module AbstractGraph
  module Composition
    class Edge

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
