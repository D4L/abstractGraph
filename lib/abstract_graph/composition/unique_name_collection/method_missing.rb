# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Handles everything.
      # a: Pass all methods into the hash.
      # t:
      # p:
      # r:
      def method_missing( m, *args, &block )
        @collection.values.send( m.to_sym, *args, &block )
      end

    end
  end
end
