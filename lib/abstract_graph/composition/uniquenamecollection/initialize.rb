# required in "abstract_graph/composition/uniquenamecollection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      def initialize
        @collection = Hash.new
        @otherUnique = [self]
      end

    end
  end
end
