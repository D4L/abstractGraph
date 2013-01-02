# required in "abstract_graph/composition/uniquenamecollection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # pass all methods into the hash
      def method_missing( m, *args, &block )
        @collection.send( m.to_sym, *args, &block )
      end

    end
  end
end
