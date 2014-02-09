# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Iterate through all objects.
      # a: Enumerates through every object.
      # t: constant
      # p: block that we pass in each object
      # r: Enumerable if no block, collection if yes block
      def each( &block )
        @collection.each_value( &block )
      end

    end
  end
end
