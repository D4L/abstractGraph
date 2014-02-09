# required in "abstract_graph/composition/unique_name_collection"

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
