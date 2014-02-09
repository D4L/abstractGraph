# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # enumerates through every object
      # p: block that we pass in each object
      def each( &block )
        @collection.each_value( &block )
      end

    end
  end
end
