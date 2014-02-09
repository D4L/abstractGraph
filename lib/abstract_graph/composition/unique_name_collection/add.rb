# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # adds an object o into the collection
      # p: Object o that implements #name
      def add( o )
        # note that otherUnique includes ourself
        @otherUnique.each do |unc|
          raise IndexError if unc.collection.has_key? o.name
        end
        @collection[o.name] = o
      end

    end
  end
end